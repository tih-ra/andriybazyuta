Templates = Andriybazyuta.Templates
Views = Andriybazyuta.Views

class Views.Embeds.Index extends Backbone.View
  tagName: 'ul'
  className: 'media-grid'
  
  initialize: ->
    _.bindAll @, 'addOne', 'addAll'
    @collection.bind 'add', @addOne, @

  addAll: ->
    @collection.each(@addOne)

  addOne: (embed)->
    view = new Views.Embeds.Embed(model: embed)
    $(@el).append( view.render().el )

  render: ->
    @addAll()
    @
