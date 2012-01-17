(function() {
  var Andriybazyuta, Main, app, u;
  app = Andriybazyuta = process['Andriybazyuta'];
  Main = require('models/main.js');
  u = require('underscore');
  exports.one = function(req, res) {
    return Main.findOne({
      slug: 'main'
    }, function(err, main) {
      if (!main) {
        main = new Main({
          slug: 'main'
        });
        main.save();
      }
      return res.send(main);
    });
  };
  exports.update = function(req, res) {
    return app.sessions_helper.auth_required(req, res, function(authorized) {
      if (authorized) {
        return Main.findOne({
          slug: 'main'
        }, function(err, main) {
          main.title = req.body.title;
          main.description = req.body.description;
          main.address = req.body.address;
          main.embed = req.body.embed;
          main.media_type = req.body.media_type;
          main.save();
          return res.send(main);
        });
      }
    });
  };
  exports.image = function(req, res) {
    return app.sessions_helper.auth_required(req, res, function(authorized) {
      if (authorized) {
        return app.alleup.upload(req, res, function(err, file, res) {
          if (err) {
            console.log(err);
          }
          return Main.findOne({
            slug: 'main'
          }, function(err, main) {
            if (main.file) {
              app.alleup.remove(main.file, function(err) {
                if (err) {
                  return console.log(err);
                }
              }, 'main');
            }
            main.file = file;
            main.save();
            res.write(file);
            return res.end();
          });
        }, 'main');
      }
    });
  };
}).call(this);
