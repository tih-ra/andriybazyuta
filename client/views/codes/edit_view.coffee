Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

class Views.Codes.Edit extends Backbone.View
  template: Templates['codes.edit']
  className: 'row'

  initialize: ->
    @model.bind 'edit:modal', ((state) -> 
      @$('#edit_code').button( if state then 'loading' else 'reset' ) ), @

  events:
    'click #delete_code' : 'delete'
    'click #edit_code' : 'edit'

  edit: ->
    view = new Views.Codes.EditModal(model: @model)
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