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
    Video.prototype.className = 'vimeo_video';
    Video.prototype.ready = function(player) {
      return $f(player).api('setColor', 'c0c0c0');
    };
    Video.prototype.render = function() {
      var video, _this;
      video = this.make('iframe', {
        id: "player_" + (this.model.get('id')),
        src: "http://player.vimeo.com/video/" + (this.model.get('id')) + "?api=1&player_id=player_" + (this.model.get('id')),
        width: 530,
        height: 300,
        frameborder: 0
      });
      _this = this;
      $(this.el).hide().html(video).slideDown('slow', function() {
        return $f(video).addEvent('ready', _this.ready);
      });
      return this;
    };
    return Video;
  })();
}).call(this);
