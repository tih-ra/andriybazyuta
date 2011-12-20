Templates = Andriybazyuta.Templates
Views = Andriybazyuta.Views

class Views.Projects.Gallery extends Backbone.View
  id: 'gallery'
  template: Templates['projects.gallery']
  events:
    'click .x-alt' : 'close'


  addItemsPreview: ->
    view = new Views.Items.Gallery(collection: @model.items)
    @$('.items_gallery').html view.render().el

  addVideosPreview: ->
    view = new Views.Videos.Index({vimeo: @model.videos, embed: @model.embeds})
    @$('.gallery_videos').fancybox(
      content: $(view.render().el).html()
    )

  close: ->
    $(@el).slideUp 'slow', ->
      $(@).remove()

  includeVideos: ->
    if @model.videos.models.length || @model.embeds.models.length
      @addVideosPreview()
    else
      @$('.gallery_videos').hide()
	
  render: ->
    
    $(@el).html @template.render(model: @model)
    
    @addItemsPreview()
    @includeVideos()
    $(@el).css('width' : "#{$(document).width()}px")
    $(@el).css('height' : "#{$(document).height()}px")
    @