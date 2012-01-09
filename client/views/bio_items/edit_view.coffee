Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

class Views.BioItems.Edit extends Backbone.View
  template: Templates['bio_items.edit']

  events:
    'click .delete_item' : 'delete'

  initialize: ->
    @model.bind 'destroy', @remove, @

  delete: ->
    @model.destroy 
      success: (model, response) ->
        console.log(response)
      error: (model, errors) ->
        console.log(errors)
      Backbone.sync('delete', @model)

  remove: ->
    $(@el).remove()

  render: ->
    $(@el).html @template.render(model: @model)
    @