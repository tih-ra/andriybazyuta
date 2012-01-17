(function() {
  var Andriybazyuta, Project, app, u;
  app = Andriybazyuta = process['Andriybazyuta'];
  Project = require('models/project.js');
  u = require('underscore');
  exports.post = function(req, res) {
    return app.sessions_helper.auth_required(req, res, function(authorized) {
      var project;
      if (authorized) {
        project = new Project({
          title: req.body.title,
          body: req.body.body,
          description: req.body.description
        });
        project.save();
        return res.send(project);
      }
    });
  };
  exports.list = function(req, res) {
    return Project.find({}).sort('createdAt', 1).execFind(function(err, projects) {
      return res.send(projects);
    });
  };
  exports.destroy = function(req, res) {
    return app.sessions_helper.auth_required(req, res, function(authorized) {
      if (authorized) {
        return Project.findOne({
          _id: req.params.id
        }, function(err, project) {
          project.items.forEach(function(item) {
            return app.alleup.remove(item.file, function(err) {
              if (err) {
                return console.log(err);
              }
            }, 'project');
          });
          return project.remove(function(err) {
            return res.send('removed');
          });
        });
      }
    });
  };
  exports.update = function(req, res) {
    return app.sessions_helper.auth_required(req, res, function(authorized) {
      if (authorized) {
        return Project.findById(req.params.id, function(err, project) {
          project.title = req.body.title;
          project.description = req.body.description;
          project.body = req.body.body;
          project.save();
          return res.send(project);
        });
      }
    });
  };
  exports.item_post = function(req, res) {
    return app.sessions_helper.auth_required(req, res, function(authorized) {
      if (authorized) {
        return app.alleup.upload(req, res, function(err, file, res) {
          if (err) {
            res.send(err);
          }
          return Project.findById(req.params.id, function(err, project) {
            project.items.push({
              file: file
            });
            project.save();
            res.write(file);
            return res.end();
          });
        }, 'project');
      }
    });
  };
  exports.item_destroy = function(req, res) {
    return app.sessions_helper.auth_required(req, res, function(authorized) {
      if (authorized) {
        return Project.findById(req.params.id, function(err, project) {
          var item;
          item = project.items.id(req.params.item_id);
          app.alleup.remove(item.file, function(err) {
            if (err) {
              return res.send(err);
            }
          }, 'project');
          item.remove();
          project.save();
          return res.end('deleted');
        });
      }
    });
  };
  exports.video_post = function(req, res) {
    return app.sessions_helper.auth_required(req, res, function(authorized) {
      if (authorized) {
        return Project.findById(req.params.id, function(err, project) {
          var video;
          video = u.filter(project.videos, function(v) {
            return parseInt(v.vimeo_id) === parseInt(req.body.vimeo_id);
          });
          if (video.length) {
            project.videos[u.indexOf(project.videos, video[0])].remove();
          } else {
            project.videos.push({
              vimeo_id: req.body.vimeo_id
            });
          }
          project.save();
          return res.end();
        });
      }
    });
  };
  exports.embed_post = function(req, res) {
    return app.sessions_helper.auth_required(req, res, function(authorized) {
      if (authorized) {
        return Project.findById(req.params.id, function(err, project) {
          project.embeds.push({
            src: req.body.src
          });
          project.save();
          return res.end();
        });
      }
    });
  };
  exports.embed_destroy = function(req, res) {
    return app.sessions_helper.auth_required(req, res, function(authorized) {
      if (authorized) {
        return Project.findById(req.params.id, function(err, project) {
          project.embeds.id(req.params.embed_id).remove();
          project.save();
          return res.end();
        });
      }
    });
  };
}).call(this);
