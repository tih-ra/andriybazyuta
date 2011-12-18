Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

class Views.Items.Gallery extends Backbone.View
  className: 'images_wrapper am-container'

  initialize: ->
    _.bindAll @, 'addOne', 'addAll'
    
  addAll: ->
    _(_.shuffle @collection.models).each (@addOne)
  
  addOne: (item)->
    img = @make 'a', {}, @make 'img', {src: item.file_url('preview')}
    $(@el).append(img)
    

  render: ->
    @addAll()
    Base.Tools.montage(@el, Base.Tools.montageGallery())
    @