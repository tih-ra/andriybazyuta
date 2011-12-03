(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  Andriybazyuta.Models.Project = (function() {
    __extends(Project, Backbone.Model);
    function Project() {
      Project.__super__.constructor.apply(this, arguments);
    }
    Project.prototype.defaults = {
      title: null,
      body: null,
      description: null,
      _id: null
    };
    Project.prototype.initialize = function() {
      return this.items = new Andriybazyuta.Collections.Items(this.get('items'));
    };
    Project.prototype.url = function() {
      if (this.get('_id')) {
        return "/projects/" + (this.get('_id'));
      } else {
        return "/projects";
      }
    };
    Project.prototype.toJSON = function() {
      return {
        title: this.get('title'),
        body: this.get('body'),
        description: this.get('description'),
        _id: this.get('_id')
      };
    };
    return Project;
  })();
}).call(this);
