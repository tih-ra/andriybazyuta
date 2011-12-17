# decalring the class
class Andriybazyuta.Models.Video extends Backbone.Model
  defaults:
    vimeo_id: null
	
  toJSON: ->
    vimeo_id: @get('vimeo_id')

  url: ->
    @collection.url
