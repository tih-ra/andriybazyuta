Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

class Views.Projects.Edit extends Backbone.View
  template: Templates['projects.edit']
  className: 'row'

  initialize: ->
    @model.bind 'edit:modal', ((state) -> 
      @$('#add_items').button( if state then 'loading' else 'reset' ) ), @

  events:
    'click #delete_project' : 'delete'
    'click #add_items' : 'addItems'

  addItems: ->
    view = new Views.Projects.EditModal(model: @model)
    $(view.render().el).modal(
      backdrop: true
      show: true
    )
  
  delete: ->
    @model.destroy 
      success: (model, response) ->
        console.log(response)
      error: (model, errors) ->
        console.log(errors)
    Backbone.sync('delete', @model)

  render: ->
    $(@el).html @template.render()
    @