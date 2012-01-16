Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

class Views.Items.Image extends Backbone.View
  tagName: 'a'
  events:
    'click .delete_image' : 'delete'

  initialize: ->
    @model.bind 'destroy', @remove, @  


  addImg: ->
    img = @make 'img', {src: @model.file_url('preview')}
    $(@el).prepend(img)

  delete: ->
    @model.destroy 
      success: (model, response) ->
        console.log response       

      Backbone.sync('delete', @model)

    
  addDeleteButton: () ->
    del = @make 'a', {class: 'webfont x-alt close delete_image'}
    $(@el).append(del)
        
  addFancyBox: ()->
    $(@el).fancybox()

  remove: ->
    $(@el).remove()


  render: ->
    $(@el).attr "href", @model.file_url('preview')
    @addImg()
    @addDeleteButton() if Andriybazyuta.Sessions.logged_in()
    @addFancyBox()

    @

