app = Andriybazyuta = process['Andriybazyuta']
Project = require('models/project.js')

exports.post = (req, res) ->
  project = new Project(
    title: req.body.title
    body: req.body.body
    description: req.body.description
  )
  project.save()
  res.send(project)

exports.list = (req, res) ->
  Project.find (err, projects) ->
    res.send projects

exports.destroy = (req, res) ->
  Project.findOne _id: req.params.id, (err, project) ->
    project.remove (err) ->
      res.send 'removed'

exports.item_post = (req, res) ->
  app.alleup_project.upload req, res, (err, file, res) ->
    if err then res.send(err)
    Project.findById req.params.id, (err, project) ->
      project.items.push({file: file})
      project.save()
      res.write(file)
      res.end()
