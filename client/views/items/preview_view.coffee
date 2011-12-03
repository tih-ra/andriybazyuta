Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

class Views.Items.Preview extends Backbone.View
  className: 'project_images'

  initialize: ->
    
    _.bindAll @, 'addOne', 'addBigOne', 'addAll'
    @collection.bind('add', @addAll, @)
    
  addAll: ->
    $(@el).html('')

    _(_.last @collection.models, 4).each (@addOne)
    _(_.first @collection.models, 1).each (@addBigOne)
 
  addOne: (item)->
    console.log(item)
    $(@el).append("<img src='#{item.file_url('mini')}'/>")

  addBigOne: (item)->
    console.log(item)
    $(@el).attr "style" : "background-image: url('#{item.file_url('banner')}')"	

  render: ->
    @addAll()
    @