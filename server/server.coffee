express = require('kassit/node_modules/express')
mongoose = require('mongoose')
alleup = require('alleup')
vimeo = require('vimeo-client')

# REST #
 

app = Andriybazyuta = process['Andriybazyuta'] = express.createServer()
app.mode = if !(getMode?()) then 'prod' else getMode()
app.port = 3002

require.paths.unshift( if app.mode is 'prod' then './api' else './server.dev/api');
sessions_helper = require('helpers/sessions')

app.use(express.logger(format: "\u001b[1m :date \u001b[1m:method\u001b[0m \u001b[33m:url\u001b[0m :response-time ms\u001b[0m :status")) unless app.mode is 'prod'

app.db = mongoose.createConnection("mongo://admin:passwd@localhost:27017/andriybazyuta")

app.use(express.bodyParser())
app.use(express.cookieParser())
app.use(express.session({ secret: '535875805420801' }))
app.use vimeo.middleware(
  consumerKey: "a3a8e7615f737162c5efb58b4bb26f8c"
  consumerSecret: "50cde6c5783b4f9c"
  baseURL: "http://localhost:3002"
  logging: "debug"
  afterLogin: "/"
  afterLogout: "/"
  permission: "read"
)

app.alleup_project = new alleup({storage : 'dir', config_file: "./alleup_project.json"});

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
app.post('/projects/:id/videos', projects.video_post)
app.post('/projects/:id/embeds', projects.embed_post)
app.del('/projects/:id/embeds/:embed_id', projects.embed_destroy)


app.get '/projects/item/:version/:file', (req, res) ->
  res.redirect(app.alleup_project.url(req.params['file'], req.params['version']))

app.get '/logged_in', (req, res) ->
  if sessions_helper.logged_in(req, res)
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
        
console.log "  ::loading: Andriybazyuta is up and serving at http://localhost:#{app.port}"
app.listen(app.port);