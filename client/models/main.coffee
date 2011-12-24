# decalring the class
class Andriybazyuta.Models.Main extends Backbone.Model
  url: '/main'
  defaults:
    slug: null
    title: null
    description: null
    address: null
    file: null
	
  toJSON: ->
    title: @get('title')
    address: @get('address')
    description: @get('description')
    slug: @get('slug')
    file: @get('file')

