(function() {
  var Views;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  Views = Andriybazyuta.Views.Root;
  Andriybazyuta.Routers.Root = (function() {
    __extends(Root, Backbone.Router);
    function Root() {
      Root.__super__.constructor.apply(this, arguments);
    }
    Root.prototype.routes = {
      '/*': 'index',
      'projects': 'projects'
    };
    Root.prototype.initialize = function() {
      return this.view = new Views.Layout;
    };
    Root.prototype.index = function() {
      return this.view.index();
    };
    Root.prototype.projects = function() {
      return this.view.projects();
    };
    return Root;
  })();
}).call(this);
