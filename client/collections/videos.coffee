# aliasing Andriybazyuta.Models (global) as Models (scoped) - this, ofcourse, is optional
Models = Andriybazyuta.Models

# decalring the class
class Andriybazyuta.Collections.Videos extends Backbone.Collection
  model: Models.Video

  initialize: (collection, options) ->
    @url = options.url
