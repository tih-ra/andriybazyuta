Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

class Views.BioItems.Edit extends Backbone.View
  template: Templates['bio_items.edit']

  render: ->
    console.log 'here'
    $(@el).html @template.render(model: @model)