Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

class Views.Items.Preview extends Backbone.View
  className: 'images_wrapper am-container'

  initialize: ->
    _.bindAll @, 'addOne', 'addAll'
    
  addAll: ->
    _(_.last @collection.models, 8).each (@addOne)
  
  addOne: (item)->
    img = @make 'a', {href: '#'}, @make 'img', {src: item.file_url('small')}
    $(@el).append(img)
    

  render: ->
    @addAll()
    Base.Tools.montage(@el)
    @