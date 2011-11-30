ProjectItems = Andriybazyuta.Views.ProjectItems = {}

Templates = Andriybazyuta.Templates


class ProjectItems.New extends Backbone.View
  template: Templates['project_items.new']
  className: 'modal hide fade'


  render: ->
    $(@el).html @template.render()
    @    