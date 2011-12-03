(function() {
  var Items, Templates;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  Items = Andriybazyuta.Views.Items = {};
  Templates = Andriybazyuta.Templates;
  Items.ProjectPreview = (function() {
    __extends(ProjectPreview, Backbone.View);
    function ProjectPreview() {
      ProjectPreview.__super__.constructor.apply(this, arguments);
    }
    ProjectPreview.prototype.className = 'project_images';
    ProjectPreview.prototype.initialize = function() {
      _.bindAll(this, 'addOne', 'addBigOne', 'addAll');
      return this.collection.bind('add', this.addAll, this);
    };
    ProjectPreview.prototype.addAll = function() {
      $(this.el).html('');
      _(_.last(this.collection.models, 4)).each(this.addOne);
      return _(_.first(this.collection.models, 1)).each(this.addBigOne);
    };
    ProjectPreview.prototype.addOne = function(item) {
      console.log(item);
      return $(this.el).append("<img src='" + (item.file_url('mini')) + "'/>");
    };
    ProjectPreview.prototype.addBigOne = function(item) {
      console.log(item);
      return $(this.el).attr({
        "style": "background-image: url('" + (item.file_url('banner')) + "')"
      });
    };
    ProjectPreview.prototype.render = function() {
      this.addAll();
      return this;
    };
    return ProjectPreview;
  })();
}).call(this);
