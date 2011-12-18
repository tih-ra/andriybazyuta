# aliasing Andriybazyuta.Models (global) as Models (scoped) - this, ofcourse, is optional
Models = Andriybazyuta.Models

# decalring the class
class Andriybazyuta.Collections.Embeds extends Backbone.Collection
  model: Models.Embed

  initialize: (collection, options) ->
    @url = options.url
