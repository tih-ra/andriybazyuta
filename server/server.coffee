express = require('kassit/node_modules/express')
mongoose = require('mongoose')
alleup = require('alleup')
vimeo = require('vimeo-client')

# REST #
 

app = Andriybazyuta = process['Andriybazyuta'] = express.createServer()
app.mode = if !(getMode?()) then 'prod' else getMode()
app.port = 3002

require.paths.unshift( if app.mode is 'prod' then './api' else './server.dev/api');
require.paths.unshift( if app.mode is 'prod' then './conf' else './server.dev/conf');
app.sessions_helper = require('helpers/sessions')

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

require('routes.js')(app)
        
console.log "  ::loading: Andriybazyuta is up and serving at http://localhost:#{app.port}"
app.listen(app.port);