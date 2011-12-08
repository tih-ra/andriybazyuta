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
  Templates = Andriybazyuta.Templates;
  Views = Andriybazyuta.Views;
  Views.VimeoVideos.Index = (function() {
    __extends(Index, Backbone.View);
    function Index() {
      Index.__super__.constructor.apply(this, arguments);
    }
    Index.prototype.id = 'vimeo_videos';
    Index.prototype.initialize = function() {
      this.collection = new Andriybazyuta.Collections.VimeoVideos;
      _.bindAll(this, 'addOne', 'addAll');
      this.collection.bind('add', this.addOne, this);
      this.collection.bind('reset', this.addAll, this);
      return this.collection.fetch();
    };
    Index.prototype.addAll = function() {
      return this.collection.each(this.addOne);
    };
    Index.prototype.addOne = function(vimeo_video) {
      var view;
      view = new Views.VimeoVideos.Video({
        model: vimeo_video
      });
      return $(this.el).append(view.render().el);
    };
    Index.prototype.render = function() {
      return this;
    };
    return Index;
  })();
}).call(this);
