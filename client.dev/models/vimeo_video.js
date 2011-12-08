(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  Andriybazyuta.Models.VimeoVideo = (function() {
    __extends(VimeoVideo, Backbone.Model);
    function VimeoVideo() {
      VimeoVideo.__super__.constructor.apply(this, arguments);
    }
    return VimeoVideo;
  })();
}).call(this);
