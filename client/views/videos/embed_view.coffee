Templates = Andriybazyuta.Templates
Views = Andriybazyuta.Views

class Views.Videos.Embed extends Backbone.View
  template: Templates['videos.embed']

  render: ->
    $(@el).html @template.render(model: @model)
    @