# aliasing Andriybazyuta.Models (global) as Models (scoped) - this, ofcourse, is optional
Models = Andriybazyuta.Models

# decalring the class
class Andriybazyuta.Collections.Items extends Backbone.Collection
  model: Models.Item

  initialize: (collection, options) ->
    @url = options.url
