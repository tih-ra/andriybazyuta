(function() {
  var Templates, Views;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  Views = Andriybazyuta.Views;
  Templates = Andriybazyuta.Templates;
  Views.Items.Preview = (function() {
    __extends(Preview, Backbone.View);
    function Preview() {
      Preview.__super__.constructor.apply(this, arguments);
    }
    Preview.prototype.className = 'project_images';
    Preview.prototype.initialize = function() {
      _.bindAll(this, 'addOne', 'addBigOne', 'addAll');
      return this.collection.bind('add', this.addAll, this);
    };
    Preview.prototype.addAll = function() {
      $(this.el).html('');
      _(_.last(this.collection.models, 4)).each(this.addOne);
      return _(_.first(this.collection.models, 1)).each(this.addBigOne);
    };
    Preview.prototype.addOne = function(item) {
      console.log(item);
      return $(this.el).append("<img src='" + (item.file_url('mini')) + "'/>");
    };
    Preview.prototype.addBigOne = function(item) {
      console.log(item);
      return $(this.el).attr({
        "style": "background-image: url('" + (item.file_url('banner')) + "')"
      });
    };
    Preview.prototype.render = function() {
      this.addAll();
      return this;
    };
    return Preview;
  })();
}).call(this);
