Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

class Views.Projects.EditModal extends Backbone.View
  template: Templates['projects.edit_modal']
  className: 'modal hide fade'

  events:
    'click .close' : 'onClose'
    
  onClose: ->
    @model.trigger('edit:modal', false)
    @model.trigger('attach:uploader', false)
    @model.unbind 'attach:uploader'

    $(@el).remove()
    
  tabUpload: ->
    view = new Views.Projects.TabUpload(model: @model)
    @$('.pill-content').append(view.render().el)

  tabEdit: ->
    view = new Views.Projects.TabEdit(model: @model)
    @$('.pill-content').append(view.render().el)
	
  render: ->
    $(@el).html @template.render()

    $(document.body).append @el

    @$('.tabs').tabs()
    
    @tabEdit()
    @tabUpload()
    @model.trigger('edit:modal', true)
    @model.trigger('attach:uploader', true)
    @

class Views.Projects.TabEdit extends Backbone.View
  template: Templates['projects.tab_edit']
  id: 'tab_edit'
  className: 'active'

  events:
    'click #save_edited' : 'save'

  save: ->
    @model.set @updateAttributes()
    @model.save @updateAttributes(),
      success: (model) =>
        console.log(model)
    
  updateAttributes: ->
    title: @$('input[name="title"]').val()
    description: @$('textarea[name="description"]').val()

  render: ->
    $(@el).html @template.render(model: @model)
    @	
	
class Views.Projects.TabUpload extends Backbone.View
  template: Templates['projects.tab_upload']
  id: 'tab_upload'

  statuses: ['queued', 'uploading', 'danger', 'info'] 

  initialize: ->
    @model.bind 'attach:uploader', @loading, @

  loading: (state) ->
    if state then @attachUploader("/projects/#{@model.get('_id')}/items") else @removeUploader()  

  attachUploader: (path) ->
    @uploader = new Base.Tools.uploader(path, @)

  removeUploader: ->
    @uploader.destroy()

  render: ->
    $(@el).html @template.render()
    
    @

  filesAdded: (files) ->
    _(files).each (file) =>
      view = new Views.Shared.Progress({file: file})

      @$('.upload').append(view.render().el)

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
