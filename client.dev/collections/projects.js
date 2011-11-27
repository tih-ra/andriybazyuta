(function() {
  var Models;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  Models = Andriybazyuta.Models;
  Andriybazyuta.Collections.Projects = (function() {
    __extends(Projects, Backbone.Collection);
    function Projects() {
      Projects.__super__.constructor.apply(this, arguments);
    }
    Projects.prototype.model = Models.Project;
    Projects.prototype.url = '/projects';
    return Projects;
  })();
}).call(this);
