# decalring the class
class Andriybazyuta.Models.Main extends Backbone.Model
  url: '/main'
  defaults:
    slug: null
    title: null
    description: null
    address: null
    file: null
    embed: null
    media_type: null
	
  toJSON: ->
    title: @get('title')
    address: @get('address')
    description: @get('description')
    slug: @get('slug')
    file: @get('file')
    embed: @get('embed')
    media_type: @get('media_type')

  file_url: (version) ->
    "/images/#{version}/#{@get('file')}"

