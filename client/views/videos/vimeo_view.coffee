Templates = Andriybazyuta.Templates
Views = Andriybazyuta.Views

class Views.Videos.Vimeo extends Backbone.View
  template: Templates['videos.vimeo']

  render: ->
    $(@el).html @template.render(model: @model)

    @