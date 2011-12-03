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
  Andriybazyuta.Collections.ProjectItems = (function() {
    __extends(ProjectItems, Backbone.Collection);
    function ProjectItems() {
      ProjectItems.__super__.constructor.apply(this, arguments);
    }
    ProjectItems.prototype.model = Models.Item;
    ProjectItems.prototype.initialize = function(attributes, options) {
      this.project = options.project;
      return this.collection = options.collection;
    };
    return ProjectItems;
  })();
}).call(this);
