Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

class Views.Main.EditModal extends Backbone.View
  template: Templates['main.edit_modal']
  className: 'modal hide fade'

  events:
    'click #save_main' : 'save'

  onClose: ->
    @model.trigger('edit:modal', false)

  save: ->
    @model.set @updateAttributes()
    @model.save @updateAttributes(),
      success: (model) =>
        console.log(model)

  updateAttributes: ->
    title: @$('input[name="title"]').val()
    description: @$('textarea[name="description"]').val()
    address: @$('textarea[name="address"]').val() 


  render: ->
    $(@el).html @template.render(model: @model)

    _this = @
    $(@el).bind 'hidden', -> _this.onClose()

    $(document.body).append @el
    @model.trigger('edit:modal', true)
    @
