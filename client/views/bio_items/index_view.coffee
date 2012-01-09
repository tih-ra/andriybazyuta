Templates = Andriybazyuta.Templates
Views = Andriybazyuta.Views

class Views.BioItems.Index extends Backbone.View

  initialize: ->
    @collection.bind('add', @addOne, @)
    _.bindAll @, 'addOne', 'addAll'

  addAll: ->
    @collection.each(@addOne)

  addOne: (item)->
    view = new Views.BioItems.Item(model: item)
    $(@el).prepend( view.render().el )

  render: ->
    @addAll()
    @
