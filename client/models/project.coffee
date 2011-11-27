# decalring the class
class Andriybazyuta.Models.Project extends Backbone.Model
  defaults:
    title: null
    body: null
    description: null
    _id: null
	
  url: -> if @get('_id') then "/projects/#{@get('_id')}" else "/projects"

  toJSON: ->
    title: @get('title')
    body: @get('body')
    description: @get('description')
    _id: @get('_id')