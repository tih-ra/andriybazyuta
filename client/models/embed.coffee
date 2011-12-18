# decalring the class
class Andriybazyuta.Models.Embed extends Backbone.Model
  defaults:
    src: null
    createdAt: null
	
  toJSON: ->
    src: @get('src')
    _id: @get('_id')
    createdAt: @get('createdAt')

  url: -> if @get('_id') then "#{@collection.url}/#{@get('_id')}" else @collection.url