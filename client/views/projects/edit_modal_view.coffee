Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

class Views.Projects.EditModal extends Backbone.View
  template: Templates['projects.edit_modal']
  className: 'modal hide fade'
    
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

  tabVimeo: ->
    view = new Views.Projects.TabVimeo(model: @model)
    @$('.pill-content').append(view.render().el)

  tabEmbed: ->
    view = new Views.Projects.TabEmbed(model: @model)
    @$('.pill-content').append(view.render().el)
	
	
  render: ->
    $(@el).html @template.render(model: @model)
    
    _this = @
    $(@el).bind 'hidden', -> _this.onClose()
    
    #NEED FOR UPLOADER
    $(document.body).append @el

    @$('.tabs').tabs()
    
    @tabEdit()
    @tabUpload()
    @tabVimeo()
    @tabEmbed()

    Base.Tools.updateButtonStatus()

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
    body: @$('textarea[name="body"]').val() 

  render: ->
    $(@el).html @template.render(model: @model)
    @	



class Views.Projects.TabUpload extends Backbone.View
  template: Templates['projects.tab_upload']
  id: 'tab_upload'

  initUploader: ->
    view = new Views.Shared.Uploader({model: @model, path: "/projects/#{@model.get('_id')}/items", parent: @})
    @$('.upload').html view.render().el

  render: ->
    $(@el).html @template.render()
    @initUploader()
    @

  addItem: (file) ->
    model = new Andriybazyuta.Models.Item
    model.set({file: file})
    @model.items.add(model)


class Views.Projects.TabVimeo extends Backbone.View
  id: 'tab_vimeo'
  
  initialize: ->
    @model.bind 'video:attach', @attach, @
    @model.bind 'video:unattach', @unattach, @

  attach: (vimeo_id)->
    console.log('attach')
    model = new Andriybazyuta.Models.Video
    model.collection = @model.videos
     
    model.save {vimeo_id: vimeo_id},
      success: (model, response) =>
        @model.videos.add(model)

  unattach: (vimeo_id)->
    console.log('unattach')
    model = _.find @model.videos.models, (video) -> video.attributes.vimeo_id.toString() is vimeo_id
    
    model.save {vimeo_id: vimeo_id},
      success: (model, response) =>
        @model.videos.remove(model)

  render: ->
    view = new Views.VimeoVideos.Index(model: @model)
    $(@el).html view.render().el
    @


class Views.Projects.TabEmbed extends Backbone.View
  template: Templates['projects.tab_embed']
  id: 'tab_embed'

  events:
    'click #save_embed' : 'save'

  save: ->
    model = new Andriybazyuta.Models.Embed
    model.collection = @model.embeds

    model.save @embedAttributes(),
      success: (model, response) =>
        @model.embeds.add model
        @$('input[name="embed"]').val('')
        

  embedAttributes: ->
    src: @$('input[name="embed"]').val()

  renderEmbeds: ->
    view = new Views.Embeds.Index(collection: @model.embeds)
    @$('.embeds').html view.render().el
	
  render: ->
    $(@el).html @template.render(model: @model)
    @renderEmbeds()
    @	
