Templates = Andriybazyuta.Templates
Views = Andriybazyuta.Views

class Views.BioItems.Item extends Backbone.View
  className: 'row'
  template: Templates['bio_items.item']

  initialize: ->
    @model.bind 'destroy', @remove, @
    @model.bind 'change', @render, @

  remove: ->
    $(@el).remove()

  render: ->
    $(@el).html @template.render(model: @model)
    
    @
