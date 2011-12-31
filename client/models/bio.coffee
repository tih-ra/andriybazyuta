# decalring the class
class Andriybazyuta.Models.Bio extends Backbone.Model
  defaults:
    title: null
    body: null
    _id: null

  initialize: ->
    @items = new Andriybazyuta.Collections.BioItems(@get('items'))

  url: -> if @get('_id') then "/bios/#{@get('_id')}" else "/bios"

  toJSON: ->
    title: @get('title')
    body: @get('body')
    _id: @get('_id')