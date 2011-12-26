Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates


class Views.Codes.Code extends Backbone.View
  template: Templates['codes.code']
  className: 'project'

  initialize: ->
    @model.bind 'destroy', @remove, @
    @model.bind 'change', @onChange, @
  
  addEditPanel: ->
    view = new Views.Codes.Edit(model: @model)
    $(@el).append view.render().el

  onChange: ->
    @render()
    @model.trigger('edit:modal', true)
	
  remove: ->
    $(@el).remove()

  render: ->
    $(@el).html @template.render(model: @model)	
    @addEditPanel() if Andriybazyuta.Sessions.logged_in()
    @
