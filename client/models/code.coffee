# decalring the class
class Andriybazyuta.Models.Code extends Backbone.Model
  defaults:
    title: null
    body: null
    description: null
    _id: null
    link: null
    languages: null

  url: -> if @get('_id') then "/codes/#{@get('_id')}" else "/codes"

  toJSON: ->
    title: @get('title')
    body: @get('body')
    description: @get('description')
    _id: @get('_id')
    link: @get('link')
    languages: @get('languages')