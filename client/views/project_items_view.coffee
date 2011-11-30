ProjectItems = Andriybazyuta.Views.ProjectItems = {}

Templates = Andriybazyuta.Templates


class ProjectItems.New extends Backbone.View
  template: Templates['project_items.new']
  className: 'modal hide fade'
  
  events:
    'click .close' : 'reset_add_items_button'

  reset_add_items_button: ->
    @model.trigger('add_items_button', 'reset')

  render: ->
    $(@el).html @template.render()
    
    @model.trigger('add_items_button', 'loading')
    @    