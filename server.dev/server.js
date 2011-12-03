(function() {
  var Andriybazyuta, alleup, app, express, mongoose, projects;
  express = require('kassit/node_modules/express');
  mongoose = require('mongoose');
  alleup = require('alleup');
  app = Andriybazyuta = process['Andriybazyuta'] = express.createServer();
  app.mode = !(typeof getMode === "function" ? getMode() : void 0) ? 'prod' : getMode();
  app.port = 3000;
  if (app.mode !== 'prod') {
    app.use(express.logger({
      format: "\u001b[1m :date \u001b[1m:method\u001b[0m \u001b[33m:url\u001b[0m :response-time ms\u001b[0m :status"
    }));
  }
  app.db = mongoose.createConnection("mongo://admin:passwd@localhost:27017/andriybazyuta");
  app.use(express.bodyParser());
  app.use(express.cookieParser());
  app.use(express.session({
    secret: '535875805420801'
  }));
  app.alleup_project = new alleup({
    storage: "dir",
    config_file: "./alleup_project.json"
  });
  app.get('/', function(req, res) {
    return res.sendfile('andriybazyuta.html');
  });
  app.get('/andriybazyuta.js', function(req, res) {
    return res.sendfile('andriybazyuta.js');
  });
  app.get('/include.json', function(req, res) {
    return res.sendfile('include.json');
  });
  app.get('/static/*', function(req, res) {
    return res.sendfile('static/' + req.params[0]);
  });
  require.paths.unshift(app.mode === 'prod' ? './api' : './server.dev/api');
  projects = require('controllers/projects.js');
  app.post('/projects', projects.post);
  app.get('/projects', projects.list);
  app.del('/projects/:id', projects.destroy);
  app.post('/projects/:id/items', projects.item_post);
  app.get('/projects/item/:version/:file', function(req, res) {
    return res.sendfile(app.alleup_project.url(req.params['file'], req.params['version']));
  });
  if (app.mode === 'dev') {
    app.get('/client.dev/*', function(req, res) {
      return res.sendfile('client.dev/' + req.params[0]);
    });
  }
  if (app.mode === 'prod') {
    app.get('/client.prod/*', function(req, res) {
      return res.sendfile('client.prod/' + req.params[0]);
    });
  }
  console.log("  ::loading: Andriybazyuta is up and serving at http://localhost:" + app.port);
  app.listen(app.port);
}).call(this);
