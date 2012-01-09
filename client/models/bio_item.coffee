# decalring the class
class Andriybazyuta.Models.BioItem extends Backbone.Model
  defaults:
    eventedAt: null
    description: null
    _id: null
	
  toJSON: ->
    eventedAt: @get('eventedAt')
    description: @get('description')
    _id: @get('_id')

  url: ->
    if @get('_id') then "/bios/#{@collection.parent_id}/items/#{@get('_id')}" else "/bios/#{@collection.parent_id}/items"
    