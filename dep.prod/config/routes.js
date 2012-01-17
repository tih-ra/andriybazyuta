(function() {
  module.exports = function(app, vimeo) {
    var bios, codes, main, projects;
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
    projects = require('controllers/projects.js');
    app.post('/projects', projects.post);
    app.get('/projects', projects.list);
    app.del('/projects/:id', projects.destroy);
    app.post('/projects/:id', projects.update);
    app.post('/projects/:id/items', projects.item_post);
    app.del('/projects/:id/items/:item_id', projects.item_destroy);
    app.post('/projects/:id/videos', projects.video_post);
    app.post('/projects/:id/embeds', projects.embed_post);
    app.del('/projects/:id/embeds/:embed_id', projects.embed_destroy);
    main = require('controllers/main.js');
    app.get('/main', main.one);
    app.post('/main', main.update);
    app.post('/main/image', main.image);
    codes = require('controllers/codes.js');
    app.post('/codes', codes.post);
    app.get('/codes', codes.list);
    app.del('/codes/:id', codes.destroy);
    app.post('/codes/:id', codes.update);
    bios = require('controllers/bios.js');
    app.post('/bios', bios.post);
    app.get('/bios', bios.list);
    app.del('/bios/:id', bios.destroy);
    app.post('/bios/:id', bios.update);
    app.post('/bios/:id/items', bios.item_post);
    app.post('/bios/:id/items/:item_id', bios.item_update);
    app.del('/bios/:id/items/:item_id', bios.item_destroy);
    app.get('/images/:version/:file', function(req, res) {
      return res.redirect(app.alleup.url(req.params['file'], req.params['version']));
    });
    app.get('/logged_in', function(req, res) {
      if (app.sessions_helper.logged_in(req, res)) {
        return res.send(req.session.vimeo);
      } else {
        return res.end();
      }
    });
    app.get('/vimeo/video', function(req, res) {
      return vimeo.get({
        method: "vimeo.videos.getAll"
      }, req, function(err, data, response) {
        return res.send(err ? err : JSON.parse(data).videos.video);
      });
    });
    if (app.mode === 'dev') {
      app.get('/client.dev/*', function(req, res) {
        return res.sendfile('client.dev/' + req.params[0]);
      });
    }
    if (app.mode === 'prod') {
      return app.get('/client.prod/*', function(req, res) {
        return res.sendfile('client.prod/' + req.params[0]);
      });
    }
  };
}).call(this);
