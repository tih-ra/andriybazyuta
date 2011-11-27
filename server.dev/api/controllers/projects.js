(function() {
  var Project;
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
      return project.remove(function(err) {
        return res.send('removed');
      });
    });
  };
}).call(this);
