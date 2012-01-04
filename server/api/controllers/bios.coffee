app = Andriybazyuta = process['Andriybazyuta']
Bio = require('models/bio.js')
u = require('underscore')


exports.post = (req, res) ->
  app.sessions_helper.auth_required req, res, (authorized) ->
    if authorized
      bio = new Bio(
        title: req.body.title
        body: req.body.body
      )
      bio.save()
      res.send(bio)

exports.list = (req, res) ->
  Bio.find({}).sort('createdAt', 1).execFind (err, bio) ->
    res.send bio

exports.destroy = (req, res) ->
  app.sessions_helper.auth_required req, res, (authorized) ->
    if authorized
  
      Bio.findOne _id: req.params.id, (err, bio) ->
        bio.remove (err) ->
          res.send 'removed'

exports.update = (req, res) ->
  app.sessions_helper.auth_required req, res, (authorized) ->
    if authorized
		
      Bio.findById req.params.id, (err, bio) ->
	
        bio.title = req.body.title
        bio.body = req.body.body

        bio.save()
        res.send(bio)
