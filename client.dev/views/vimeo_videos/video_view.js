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
  Views.VimeoVideos.Video = (function() {
    __extends(Video, Backbone.View);
    function Video() {
      Video.__super__.constructor.apply(this, arguments);
    }
    Video.prototype.template = Templates['video_videos.video'];
    Video.prototype.className = 'video_video';
    Video.prototype.render = function() {
      var video;
      video = this.make('iframe', {
        src: "http://player.vimeo.com/video/" + (this.model.get('id')) + "?api=1&player_id=player_" + (this.model.get('id')),
        width: 530,
        height: 300,
        frameborder: 0
      });
      $(this.el).html(video);
      return this;
    };
    return Video;
  })();
}).call(this);
