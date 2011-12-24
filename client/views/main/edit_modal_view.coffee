Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

class Views.Main.EditModal extends Backbone.View
  template: Templates['main.edit_modal']
  className: 'modal hide fade'

  events:
    'click #save_main' : 'save'

  onClose: ->
    @model.trigger('edit:modal', false)
    @model.trigger('attach:uploader', false)
    @model.unbind 'attach:uploader'

  save: ->
    @model.set @updateAttributes()
    @model.save @updateAttributes(),
      success: (model) =>
        console.log(model)

  initUploader: ->
    view = new Views.Shared.Uploader({model: @model, path: "/main/image", parent: @, button: 'upload_main_file'})
    @$('.upload').html view.render().el

  addItem: (file) ->
    @model.set({file: file})

  updateAttributes: ->
    title: @$('input[name="title"]').val()
    description: @$('textarea[name="description"]').val()
    address: @$('textarea[name="address"]').val() 

  render: ->
    $(@el).html @template.render(model: @model)
    @initUploader()

    _this = @
    $(@el).bind 'hidden', -> _this.onClose()

    $(document.body).append @el
    @model.trigger('edit:modal', true)
    @model.trigger('attach:uploader', true)

    
    @
