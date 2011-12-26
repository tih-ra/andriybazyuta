app = Andriybazyuta = process['Andriybazyuta']
Code = require('models/code.js')
u = require('underscore')


exports.post = (req, res) ->
  app.sessions_helper.auth_required req, res, (authorized) ->
    if authorized
      code = new Code(
        title: req.body.title
        body: req.body.body
        description: req.body.description
        link: req.body.link
        languages: req.body.languages
      )
      code.save()
      res.send(code)

exports.list = (req, res) ->
  Code.find({}).sort('createdAt', 1).execFind (err, code) ->
    res.send code

exports.destroy = (req, res) ->
  app.sessions_helper.auth_required req, res, (authorized) ->
    if authorized
  
      Code.findOne _id: req.params.id, (err, code) ->
        code.remove (err) ->
          res.send 'removed'

exports.update = (req, res) ->
  app.sessions_helper.auth_required req, res, (authorized) ->
    if authorized
		
      Code.findById req.params.id, (err, code) ->
	
        code.title = req.body.title
        code.description = req.body.description
        code.body = req.body.body
        code.link = req.body.link
        code.languages = req.body.languages

        code.save()
        res.send(code)
