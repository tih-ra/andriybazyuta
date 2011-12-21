Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

class Views.Main.Edit extends Backbone.View
  template: Templates['main.edit']
  className: 'span14'

  initialize: ->
    @model.bind 'edit:modal', ((state) -> 
      @$('#edit_main').button( if state then 'loading' else 'reset' ) ), @

  events:
    'click #edit_main' : 'editModal'

  editModal: ->
    view = new Views.Main.EditModal(model: @model)
    $(view.render().el).modal(
      backdrop: true
      show: true
    )
  
  render: ->
    $(@el).html @template.render()
    @