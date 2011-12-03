# decalring the class
class Andriybazyuta.Models.Item extends Backbone.Model
  defaults:
    file: null
	
  toJSON: ->
    file: @get('file')
    _id: @get('_id')

  file_url: (version) ->
    "#{@collection.url}/item/#{version}/#{@get('file')}"