# decalring the class
class Andriybazyuta.Models.BioItem extends Backbone.Model
  defaults:
    date: null
    description: null
	
  toJSON: ->
    date: @get('date')
    description: @get('description')
    _id: @get('_id')
