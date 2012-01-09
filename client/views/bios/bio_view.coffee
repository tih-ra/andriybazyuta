Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates


class Views.Bios.Bio extends Backbone.View
  template: Templates['bios.bio']
  className: 'bio'

  initialize: ->
    @model.bind 'destroy', @remove, @
    @model.bind 'change', @onChange, @
  
  addEditPanel: ->
    view = new Views.Bios.Edit(model: @model)
    $(@el).append view.render().el

  onChange: ->
    @render()
    @model.trigger('edit:modal', true)

  addItems: ->
    view = new Views.BioItems.Index(collection: @model.items)
    @$('.bio_items').html view.render().el
	
  remove: ->
    $(@el).remove()

  render: ->
    
    $(@el).html @template.render(model: @model)
    @addItems()    
    @addEditPanel() if Andriybazyuta.Sessions.logged_in()
    @
