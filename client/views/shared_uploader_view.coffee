SharedUploader = Andriybazyuta.Views.SharedUploader = {}

Templates = Andriybazyuta.Templates


class SharedUploader.New extends Backbone.View
  template: Templates['shared_uploader.new']
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
      view = new SharedUploader.Progress({file: file})
      
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
	

class SharedUploader.Progress extends Backbone.View
  template: Templates['shared_uploader.progress']
  className: 'progress'
  
  initialize: (options) ->
    @file = options.file
    $(@el).attr 'id', @file.id


  render: ->
    $(@el).html @template.render(file: @file)
    console.log(@template)
    @

