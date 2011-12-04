(function() {
  var Andriybazyuta, Project, app;
  app = Andriybazyuta = process['Andriybazyuta'];
  Project = require('models/project.js');
  exports.post = function(req, res) {
    var project;
    project = new Project({
      title: req.body.title,
      body: req.body.body,
      description: req.body.description
    });
    project.save();
    return res.send(project);
  };
  exports.list = function(req, res) {
    return Project.find(function(err, projects) {
      return res.send(projects);
    });
  };
  exports.destroy = function(req, res) {
    return Project.findOne({
      _id: req.params.id
    }, function(err, project) {
      project.items.forEach(function(item) {
        return app.alleup_project.remove(item.file, function(err) {
          if (err) {
            return res.end(err);
          }
        });
      });
      return project.remove(function(err) {
        return res.send('removed');
      });
    });
  };
  exports.update = function(req, res) {
    return Project.findById(req.params.id, function(err, project) {
      project.title = req.body.title;
      project.description = req.body.description;
      project.save();
      return res.send(project);
    });
  };
  exports.item_post = function(req, res) {
    return app.alleup_project.upload(req, res, function(err, file, res) {
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
    });
  };
}).call(this);
