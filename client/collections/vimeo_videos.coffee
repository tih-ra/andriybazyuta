# aliasing Andriybazyuta.Models (global) as Models (scoped) - this, ofcourse, is optional
Models = Andriybazyuta.Models

# decalring the class
class Andriybazyuta.Collections.VimeoVideos extends Backbone.Collection
  model: Models.VimeoVideo
  url: '/vimeo/video'