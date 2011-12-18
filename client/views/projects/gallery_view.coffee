Templates = Andriybazyuta.Templates
Views = Andriybazyuta.Views

class Views.Projects.Gallery extends Backbone.View
  id: 'gallery'
  template: Templates['projects.gallery']
  events:
    'click .x-alt' : 'close'


  addItemsPreview: ->
    view = new Views.Items.Gallery(collection: @model.items)
    @$('.items_gallery').html view.render().el

  close: ->
    $(@el).slideUp 'slow', ->
      $(@).remove()

  render: ->
    
    $(@el).html @template.render(model: @model)
    
    @addItemsPreview()
    $(@el).css('width' : "#{$(document).width()}px")
    $(@el).css('height' : "#{$(document).height()}px")
    @
