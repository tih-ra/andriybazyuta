Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

class Views.Bios.EditModal extends Backbone.View
  template: Templates['bios.edit_modal']
  className: 'modal hide fade'

  events:
    'click #save_bio' : 'save'

  onClose: ->
    @model.trigger('edit:modal', false)

    $(@el).remove()

  save: ->
    @model.set @updateAttributes()
    @model.save @updateAttributes(),
      success: (model) =>
        console.log(model)

  updateAttributes: ->
    title: @$('input[name="title"]').val()
    body: @$('textarea[name="body"]').val()

  render: ->
    $(@el).html @template.render(model: @model)

    _this = @
    $(@el).bind 'hidden', -> _this.onClose()

    $(document.body).append @el
    @model.trigger('edit:modal', true)
    
    @
