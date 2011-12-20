# aliasing Andriybazyuta.Models (global) as Models (scoped) - this, ofcourse, is optional
Models = Andriybazyuta.Models

# decalring the class
class Andriybazyuta.Collections.Sessions extends Backbone.Collection
  model: Models.Session
  url: '/logged_in'

  initialize: ->
    @fetch()

  logged_in: ->
    
    @length > 0 && @at(0).get('accessToken').length > 0 && @at(0).get('accessTokenSecret').length > 0