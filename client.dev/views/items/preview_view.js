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
    Preview.prototype.className = 'images_wrapper am-container';
    Preview.prototype.initialize = function() {
      return _.bindAll(this, 'addOne', 'addAll');
    };
    Preview.prototype.addAll = function() {
      return _(_.last(this.collection.models, 8)).each(this.addOne);
    };
    Preview.prototype.addOne = function(item) {
      var img;
      img = this.make('a', {
        href: '#'
      }, this.make('img', {
        src: item.file_url('small')
      }));
      return $(this.el).append(img);
    };
    Preview.prototype.render = function() {
      this.addAll();
      Base.Tools.montage(this.el);
      return this;
    };
    return Preview;
  })();
}).call(this);
