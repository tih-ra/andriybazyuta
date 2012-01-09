Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

class Views.Bios.Edit extends Backbone.View
  template: Templates['bios.edit']
  className: 'row'

  initialize: ->
    @model.bind 'edit:modal', ((state) -> 
      @$('#edit_bio').button( if state then 'loading' else 'reset' ) ), @

  events:
    'click #delete_bio' : 'delete'
    'click #edit_bio' : 'edit'

  edit: ->
    view = new Views.Bios.EditModal(model: @model)
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