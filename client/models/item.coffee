# decalring the class
class Andriybazyuta.Models.Item extends Backbone.Model
  defaults:
    file: null
    _id: null
	
  toJSON: ->
    file: @get('file')
    _id: @get('_id')

  file_url: (version) ->
    "/images/#{version}/#{@get('file')}"

  url: -> if @get('_id') then "#{@collection.url}/#{@get('_id')}" else @collection.url