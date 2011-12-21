app = Andriybazyuta = process['Andriybazyuta']
Main = require('models/main.js')
u = require('underscore')

exports.one = (req, res) ->
  Main.findOne {slug: 'main'}, (err, main) ->
    unless main
      main = new Main {slug: 'main'}
      main.save()
    res.send main

exports.update = (req, res) ->
  app.sessions_helper.auth_required req, res, (authorized) ->
    if authorized
      Main.findOne {slug: 'main'}, (err, main) ->
        main.title = req.body.title
        main.description = req.body.description
        main.address = req.body.address
        
        main.save()
        res.send(main)
