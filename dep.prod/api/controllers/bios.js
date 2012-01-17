(function() {
  var Andriybazyuta, Bio, app, u;
  app = Andriybazyuta = process['Andriybazyuta'];
  Bio = require('models/bio.js');
  u = require('underscore');
  exports.post = function(req, res) {
    return app.sessions_helper.auth_required(req, res, function(authorized) {
      var bio;
      if (authorized) {
        bio = new Bio({
          title: req.body.title,
          body: req.body.body
        });
        bio.save();
        return res.send(bio);
      }
    });
  };
  exports.list = function(req, res) {
    return Bio.find({}).sort('createdAt', 1).execFind(function(err, bio) {
      return res.send(bio);
    });
  };
  exports.destroy = function(req, res) {
    return app.sessions_helper.auth_required(req, res, function(authorized) {
      if (authorized) {
        return Bio.findOne({
          _id: req.params.id
        }, function(err, bio) {
          return bio.remove(function(err) {
            return res.send('removed');
          });
        });
      }
    });
  };
  exports.update = function(req, res) {
    return app.sessions_helper.auth_required(req, res, function(authorized) {
      if (authorized) {
        return Bio.findById(req.params.id, function(err, bio) {
          bio.title = req.body.title;
          bio.body = req.body.body;
          bio.save();
          return res.send(bio);
        });
      }
    });
  };
  exports.item_post = function(req, res) {
    return app.sessions_helper.auth_required(req, res, function(authorized) {
      if (authorized) {
        return Bio.findById(req.params.id, function(err, bio) {
          var item;
          item = bio.items.push({
            eventedAt: req.body.eventedAt,
            description: req.body.description
          });
          bio.save();
          return res.send(bio.items[item - 1]);
        });
      }
    });
  };
  exports.item_update = function(req, res) {
    return app.sessions_helper.auth_required(req, res, function(authorized) {
      if (authorized) {
        return Bio.findById(req.params.id, function(err, bio) {
          var bio_item;
          bio_item = bio.items.id(req.params.item_id);
          bio_item.eventedAt = req.body.eventedAt;
          bio_item.description = req.body.description;
          bio.save();
          return res.send(bio.items.id(req.params.item_id));
        });
      }
    });
  };
  exports.item_destroy = function(req, res) {
    return app.sessions_helper.auth_required(req, res, function(authorized) {
      if (authorized) {
        return Bio.findById(req.params.id, function(err, bio) {
          bio.items.id(req.params.item_id).remove();
          bio.save();
          return res.end('deleted');
        });
      }
    });
  };
}).call(this);
