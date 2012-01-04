Templates = Andriybazyuta.Templates
Views = Andriybazyuta.Views

class Views.BioItems.Index extends Backbone.View
  template: Templates['bio_items.index']

  initialize: ->
    _.bindAll @, 'addOne', 'addAll'

  addAll: ->
    @collection.each(@addOne)

  addOne: (item)->
    view = new Views.BioItems.Item(model: item)
    @$('#bio_items').prepend( view.render().el )

  render: ->
    $(@el).html @template.render()
    
    @
