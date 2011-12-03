(function() {
  var Items, Projects, Root, Shared, Templates, Views;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  Root = Andriybazyuta.Views.Root = {};
  Projects = Andriybazyuta.Views.Projects = {};
  Shared = Andriybazyuta.Views.Shared = {};
  Items = Andriybazyuta.Views.Items = {};
  Views = Andriybazyuta.Views;
  Templates = Andriybazyuta.Templates;
  Root.Layout = (function() {
    __extends(Layout, Backbone.View);
    function Layout() {
      Layout.__super__.constructor.apply(this, arguments);
    }
    Layout.prototype.className = 'container';
    Layout.prototype.template = Templates['root.layout'];
    Layout.prototype.initialize = function() {
      $(this.el).html(this.template.render());
      return $(document.body).html(this.el);
    };
    Layout.prototype.index = function() {
      var view;
      view = new Views.Root.Index;
      return $('#root').html(view.render().el);
    };
    Layout.prototype.projects = function() {
      var view;
      view = new Views.Projects.Index;
      return $('#root').html(view.render().el);
    };
    return Layout;
  })();
  Root.Index = (function() {
    __extends(Index, Backbone.View);
    function Index() {
      Index.__super__.constructor.apply(this, arguments);
    }
    Index.prototype.template = Templates['root.index'];
    Index.prototype.className = 'row';
    Index.prototype.render = function() {
      $(this.el).html(this.template.render());
      return this;
    };
    return Index;
  })();
}).call(this);
