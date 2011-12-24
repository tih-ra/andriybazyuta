Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

class Views.Main.EditModal extends Backbone.View
  template: Templates['main.edit_modal']
  className: 'modal hide fade'

  events:
    'click #save_main' : 'save'
    'click #background_image_button' : 'upload_image'

  onClose: ->
    @model.trigger('edit:modal', false)
    @model.trigger('attach:uploader', false)
    @model.unbind 'attach:uploader'

  save: ->
    @model.set @updateAttributes()
    @model.save @updateAttributes(),
      success: (model) =>
        console.log(model)

  upload_image: (e)->
    e.preventDefault()
    


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
    @model.trigger('attach:uploader', true)
    @
