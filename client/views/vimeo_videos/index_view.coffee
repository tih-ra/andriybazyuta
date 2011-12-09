Templates = Andriybazyuta.Templates
Views = Andriybazyuta.Views

class Views.VimeoVideos.Index extends Backbone.View
  id: 'vimeo_videos'
  

  initialize: ->
    @collection = new Andriybazyuta.Collections.VimeoVideos
    _.bindAll @, 'addOne', 'addAll'
    @collection.bind('add', @addOne, @)
    @collection.bind('reset', @addAll, @)
 
    @collection.fetch()

  addAll: ->
    @collection.each(@addOne)

  addOne: (vimeo_video)->
    view = new Views.VimeoVideos.Video(model: vimeo_video)
    $(@el).append( view.render().el )

  render: ->
	
    @
