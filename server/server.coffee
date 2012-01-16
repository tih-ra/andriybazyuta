express = require('kassit/node_modules/express')
mongoose = require('mongoose')

vimeo = require('vimeo-client')
alleupInit = require('alleup')



# REST #
 

app = Andriybazyuta = process['Andriybazyuta'] = express.createServer()
app.mode = if !(getMode?()) then 'prod' else getMode()

CONFIG = require('config')[app.mode]

app.port = CONFIG.app.port

require.paths.unshift( if app.mode is 'prod' then './api' else './server.dev/api');
require.paths.unshift( if app.mode is 'prod' then './config' else './server.dev/config');
app.sessions_helper = require('helpers/sessions')

app.use(express.logger(format: "\u001b[1m :date \u001b[1m:method\u001b[0m \u001b[33m:url\u001b[0m :response-time ms\u001b[0m :status")) unless app.mode is 'prod'

app.db = mongoose.createConnection("mongo://#{CONFIG.db.user}:#{CONFIG.db.passwd}@#{CONFIG.db.host}:#{CONFIG.db.port}/#{CONFIG.db.database}")

app.use(express.bodyParser())
app.use(express.cookieParser())
app.use(express.session({ secret: '535875805420801' }))
app.use vimeo.middleware(
  consumerKey: CONFIG.vimeo.consumerKey
  consumerSecret: CONFIG.vimeo.consumerSecret
  baseURL: CONFIG.app.url
  logging: "debug"
  afterLogin: "/"
  afterLogout: "/"
  permission: "read"
)


app.alleup = new alleupInit({storage : CONFIG.app.storage, config_file: "./alleup_conf.json"})


require('routes.js')(app, vimeo)
        
console.log "  ::loading: Andriybazyuta is up and serving at http://localhost:#{app.port}"
app.listen(app.port);