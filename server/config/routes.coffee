module.exports = (app, vimeo) -> 
	
  app.get '/', (req, res) -> res.sendfile('andriybazyuta.html')
  app.get '/andriybazyuta.js', (req, res) -> res.sendfile('andriybazyuta.js')
  app.get '/include.json', (req, res) -> res.sendfile('include.json')

  app.get '/static/*', (req, res) -> res.sendfile('static/' + req.params[0])


  projects = require('controllers/projects.js')
  app.post('/projects', projects.post)
  app.get('/projects', projects.list)
  app.del('/projects/:id', projects.destroy)
  app.post('/projects/:id', projects.update)
  app.post('/projects/:id/items', projects.item_post)
  app.del('/projects/:id/items/:item_id', projects.item_destroy)
  app.post('/projects/:id/videos', projects.video_post)
  app.post('/projects/:id/embeds', projects.embed_post)
  app.del('/projects/:id/embeds/:embed_id', projects.embed_destroy)


  main = require('controllers/main.js')
  app.get('/main', main.one)
  app.post('/main', main.update)
  app.post('/main/image', main.image)

  codes = require('controllers/codes.js')
  app.post('/codes', codes.post)
  app.get('/codes', codes.list)
  app.del('/codes/:id', codes.destroy)
  app.post('/codes/:id', codes.update)

  bios = require('controllers/bios.js')
  app.post('/bios', bios.post)
  app.get('/bios', bios.list)
  app.del('/bios/:id', bios.destroy)
  app.post('/bios/:id', bios.update)
  app.post('/bios/:id/items', bios.item_post)
  app.post('/bios/:id/items/:item_id', bios.item_update)
  app.del('/bios/:id/items/:item_id', bios.item_destroy)


  app.get '/images/:version/:file', (req, res) ->
    res.redirect(app.alleup.url(req.params['file'], req.params['version']))

  app.get '/logged_in', (req, res) ->
    if app.sessions_helper.logged_in(req, res)
      res.send(req.session.vimeo)
    else
      res.end()    

  app.get '/vimeo/video', (req, res) ->
    vimeo.get
      method: "vimeo.videos.getAll"
    , req, (err, data, response) ->
      res.send if err then err else JSON.parse(data).videos.video



  # serving only dev/prod files
  (app.get '/client.dev/*', (req, res) ->  res.sendfile('client.dev/' + req.params[0])) if app.mode is 'dev'
  (app.get '/client.prod/*', (req, res) -> res.sendfile('client.prod/' + req.params[0])) if app.mode is 'prod'
