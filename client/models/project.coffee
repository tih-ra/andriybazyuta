# decalring the class
class Andriybazyuta.Models.Project extends Backbone.Model
  defaults:
    title: null
    body: null
    description: null
    _id: null

  initialize: ->
    @items = new Andriybazyuta.Collections.Items(@get('items'), {url: "/projects/#{@get('_id')}/items"})
    @videos = new Andriybazyuta.Collections.Videos(@get('videos'), {url: "/projects/#{@get('_id')}/videos"})
    @embeds = new Andriybazyuta.Collections.Embeds(@get('embeds'), {url: "/projects/#{@get('_id')}/embeds"})

	
  url: -> if @get('_id') then "/projects/#{@get('_id')}" else "/projects"

  toJSON: ->
    title: @get('title')
    body: @get('body')
    description: @get('description')
    _id: @get('_id')