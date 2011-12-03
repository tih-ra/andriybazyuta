Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates


class Views.Projects.Project extends Backbone.View
  template: Templates['projects.project']
  className: 'project'

  initialize: ->
    @model.bind 'destroy', @remove, @
  
  addEditPanel: ->
    view = new Views.Projects.Edit(model: @model)
    console.log @model
    $(@el).append view.render().el
  
  addItemsPreview: ->
    view = new Views.Items.Preview(collection: @model.items)
    @$('.items_preview').html view.render().el

  remove: ->
    $(@el).remove()

  render: ->
    $(@el).html @template.render(model: @model)
    @addItemsPreview()
    @addEditPanel()
    @
