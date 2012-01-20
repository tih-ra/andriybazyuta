Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

class Views.Items.Gallery extends Backbone.View
  className: 'images_wrapper am-container'

  initialize: ->
    _.bindAll @, 'addOne', 'addAll'
    
  addAll: ->
    _(_.shuffle @collection.models).each (@addOne)
  
  addOne: (item)->
    Base.Tools.show_loader()
    view = new Views.Items.Image(model: item)
    $(@el).append view.render().el

  render: ->
    @addAll()
    
    Base.Tools.montage(@el, Base.Tools.montageGallery())
    $.scrollTo({top:'0px', left:'0px'}, 1000)
    @