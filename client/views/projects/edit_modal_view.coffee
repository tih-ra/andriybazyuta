Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

class Views.Projects.EditModal extends Backbone.View
  template: Templates['projects.edit_modal']
  className: 'modal hide fade'
  statuses: ['queued', 'uploading', 'danger', 'info']  

  events:
    'click .close' : 'onClose'
    
  onClose: ->
    @model.trigger('add_items_button_mode', 'reset')
    @removeUploader()
    $(@el).remove()
    
  attachUploader: (path) ->
    @uploader = Base.Tools.uploader(path, @)

  removeUploader: ->
    @uploader.destroy()
  
  render: ->
    $(@el).html @template.render()
    @model.trigger('add_items_button_mode', 'loading')
    @

  filesAdded: (files) ->
    _(files).each (file) =>
      view = new Views.Shared.Progress({file: file})
      
      @$('.modal-body').append(view.render().el)
		
  setState: (file) ->
    $("##{file.id} > div").css(width: "#{file.percent}%")

  setPercent: (file) ->
    #message = I18n.t('editor.items.new_file.percent', percent: "#{file.percent} %")

  setStatus: (file) ->
    status = @statuses[file.status - 2]
    $("##{file.id}").addClass(status)

  addItem: (file) ->
    model = new Andriybazyuta.Models.Item
    model.set({file: file})
    @model.items.add(model)
