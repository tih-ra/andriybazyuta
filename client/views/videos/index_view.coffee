Templates = Andriybazyuta.Templates
Views = Andriybazyuta.Views

class Views.Videos.Index extends Backbone.View
  
  initialize: (options) ->
    @vimeo_collection = options.vimeo
    @embed_collection = options.embed

    _.bindAll @, 'addVimeos', 'addEmbeds', 'addVimeo', 'addEmbed'
    

  addVimeos: ->
    @vimeo_collection.each(@addVimeo)

  addVimeo: (video)->
    view = new Views.Videos.Vimeo(model: video)
    $(@el).append( view.render().el )

  addEmbeds: ->
    @embed_collection.each(@addEmbed)

  addEmbed: (video)->
    view = new Views.Videos.Embed(model: video)
    $(@el).append( view.render().el )
  

  render: ->
    @addVimeos()
    @addEmbeds()
    @
