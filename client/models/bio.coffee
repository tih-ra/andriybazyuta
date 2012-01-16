# decalring the class
class Andriybazyuta.Models.Bio extends Backbone.Model
  defaults:
    title: null
    body: null
    _id: null

  initialize: ->
    _this = @
    items = _.sortBy _this.get('items'), (item) ->  new Date(item.eventedAt)
    @items = new Andriybazyuta.Collections.BioItems(items, {parent_id: @get('_id')})

  url: -> if @get('_id') then "/bios/#{@get('_id')}" else "/bios"

  toJSON: ->
    title: @get('title')
    body: @get('body')
    _id: @get('_id')