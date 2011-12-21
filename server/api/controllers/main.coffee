app = Andriybazyuta = process['Andriybazyuta']
Main = require('models/main.js')
u = require('underscore')

exports.one = (req, res) ->
  Main.findOne {slug: 'main'}, (err, main) ->
    unless main
      main = new Main {slug: 'main'}
      main.save()
  res.send main
	    