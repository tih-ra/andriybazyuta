Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

class Views.Items.Gallery extends Backbone.View
  className: 'images_wrapper am-container'

  initialize: ->
    _.bindAll @, 'addOne', 'addAll'
    
  addAll: ->
    _(_.shuffle @collection.models).each (@addOne)
  
  addOne: (item)->
    img = @make 'a', {href: item.file_url('preview')}, @make 'img', {src: item.file_url('preview')}
    $(@el).append(img)
    
    @addFancyBox(img)
    
    
  addFancyBox: (img)->
    $(img).fancybox()

  render: ->
    @addAll()
    Base.Tools.montage(@el, Base.Tools.montageGallery())
    @