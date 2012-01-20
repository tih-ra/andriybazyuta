Templates = Andriybazyuta.Templates
Views = Andriybazyuta.Views

class Views.Embeds.Embed extends Backbone.View
  template: Templates['embeds.embed']
  tagName: 'li'

  events:
    'click .delete_embed' : 'delete'

  initialize: ->
    @model.bind 'destroy', @remove, @  

  delete: ->
    @model.destroy 
      success: (model, response) ->
        console.log response       
    
      Backbone.sync('delete', @model)

  remove: ->
    $(@el).remove()

  render: ->
    $(@el).html @template.render(model: @model)
    @