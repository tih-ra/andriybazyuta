Views = Andriybazyuta.Views

Templates = Andriybazyuta.Templates

class Views.Shared.Progress extends Backbone.View
  template: Templates['shared.progress']
  className: 'progress'
  
  initialize: (options) ->
    @file = options.file
    $(@el).attr 'id', @file.id


  render: ->
    $(@el).html @template.render(file: @file)
    console.log(@template)
    @

