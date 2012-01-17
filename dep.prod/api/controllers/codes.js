(function() {
  var Andriybazyuta, Code, app, u;
  app = Andriybazyuta = process['Andriybazyuta'];
  Code = require('models/code.js');
  u = require('underscore');
  exports.post = function(req, res) {
    return app.sessions_helper.auth_required(req, res, function(authorized) {
      var code;
      if (authorized) {
        code = new Code({
          title: req.body.title,
          body: req.body.body,
          description: req.body.description,
          link: req.body.link,
          languages: req.body.languages
        });
        code.save();
        return res.send(code);
      }
    });
  };
  exports.list = function(req, res) {
    return Code.find({}).sort('createdAt', 1).execFind(function(err, code) {
      return res.send(code);
    });
  };
  exports.destroy = function(req, res) {
    return app.sessions_helper.auth_required(req, res, function(authorized) {
      if (authorized) {
        return Code.findOne({
          _id: req.params.id
        }, function(err, code) {
          return code.remove(function(err) {
            return res.send('removed');
          });
        });
      }
    });
  };
  exports.update = function(req, res) {
    return app.sessions_helper.auth_required(req, res, function(authorized) {
      if (authorized) {
        return Code.findById(req.params.id, function(err, code) {
          code.title = req.body.title;
          code.description = req.body.description;
          code.body = req.body.body;
          code.link = req.body.link;
          code.languages = req.body.languages;
          code.save();
          return res.send(code);
        });
      }
    });
  };
}).call(this);
