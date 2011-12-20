Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates


class Views.Projects.Project extends Backbone.View
  template: Templates['projects.project']
  className: 'project'

  events:
    'click .items_preview' : 'showGallery'

  initialize: ->
    @model.bind 'destroy', @remove, @
    @model.bind 'change', @onChange, @
    @model.items.bind 'add', @addItemsPreview, @
    console.log(@model)
  
  addEditPanel: ->
    view = new Views.Projects.Edit(model: @model)
    $(@el).append view.render().el

  showGallery: ->
    view = new Views.Projects.Gallery(model: @model)
    $(view.render().el).hide().appendTo(document.body).slideDown('slow')
  
  addItemsPreview: ->
    view = new Views.Items.Preview(collection: @model.items)
    @$('.items_preview').html view.render().el

  onChange: ->
    @render()
    @model.trigger('edit:modal', true)
	
  remove: ->
    $(@el).remove()

  render: ->
    $(@el).html @template.render(model: @model)	
    @addItemsPreview()
    @addEditPanel() if Andriybazyuta.Sessions.logged_in()
    @
