app = Andriybazyuta = process['Andriybazyuta']
Project = require('models/project.js')
u = require('underscore')


exports.post = (req, res) ->
  app.sessions_helper.auth_required req, res, (authorized) ->
    if authorized
	
      project = new Project(
        title: req.body.title
        body: req.body.body
        description: req.body.description
      )
      project.save()
      res.send(project)

exports.list = (req, res) ->
  Project.find({}).sort('createdAt', 1).execFind (err, projects) ->
    res.send projects

exports.destroy = (req, res) ->
  app.sessions_helper.auth_required req, res, (authorized) ->
    if authorized
  
      Project.findOne _id: req.params.id, (err, project) ->
	
        project.items.forEach (item) ->
          app.alleup.remove(item.file, (err) ->
            if err then console.log(err)
          , 'project')

        project.remove (err) ->
          res.send 'removed'

exports.update = (req, res) ->
  app.sessions_helper.auth_required req, res, (authorized) ->
    if authorized
		
      Project.findById req.params.id, (err, project) ->
	
        project.title = req.body.title
        project.description = req.body.description
        project.body = req.body.body

        project.save()
        res.send(project)

exports.item_post = (req, res) ->
  app.sessions_helper.auth_required req, res, (authorized) ->
    if authorized
		
      app.alleup.upload(req, res, (err, file, res) ->
        if err then res.send(err)
        Project.findById req.params.id, (err, project) ->
          project.items.push({file: file})
          project.save()
          res.write(file)

          res.end()
      , 'project')

exports.item_destroy = (req, res) ->
  app.sessions_helper.auth_required req, res, (authorized) ->
    if authorized

      Project.findById req.params.id, (err, project) ->
        item = project.items.id(req.params.item_id)
        
        app.alleup.remove(item.file, (err) ->
          if err then res.send(err)
        , 'project')
        item.remove()
        project.save()

        res.end('deleted')


exports.video_post = (req, res) ->
  app.sessions_helper.auth_required req, res, (authorized) ->
    if authorized
	
      Project.findById req.params.id, (err, project) ->

        video = u.filter project.videos, (v) -> parseInt(v.vimeo_id) is parseInt(req.body.vimeo_id)
     
        if video.length
          project.videos[u.indexOf(project.videos, video[0])].remove() 
        else 
          project.videos.push({vimeo_id: req.body.vimeo_id})

        project.save()

        res.end()

exports.embed_post = (req, res) ->
  app.sessions_helper.auth_required req, res, (authorized) ->
    if authorized
	
      Project.findById req.params.id, (err, project) ->
        project.embeds.push({src: req.body.src})
        project.save()

        res.end()

exports.embed_destroy = (req, res) ->
  app.sessions_helper.auth_required req, res, (authorized) ->
    if authorized
	
      Project.findById req.params.id, (err, project) ->
        project.embeds.id(req.params.embed_id).remove()
        project.save()

        res.end()