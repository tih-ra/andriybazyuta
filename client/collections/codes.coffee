# aliasing Andriybazyuta.Models (global) as Models (scoped) - this, ofcourse, is optional
Models = Andriybazyuta.Models

# decalring the class
class Andriybazyuta.Collections.Codes extends Backbone.Collection
  model: Models.Code
  url: '/codes'
