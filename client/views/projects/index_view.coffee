Templates = Andriybazyuta.Templates
Views = Andriybazyuta.Views

class Views.Projects.Index extends Backbone.View
  id: 'projects'

  initialize: ->
    @collection = new Andriybazyuta.Collections.Projects
    _.bindAll @, 'addOne', 'addAll'
    @collection.bind('add', @addOne, @)
    @collection.bind('reset', @addAll, @)
#    @collection.bind('all',   @render, @)
    @collection.fetch()

  addAll: ->
    @collection.each(@addOne)

  addOne: (project)->
    view = new Views.Projects.Project(model: project)
    $(@el).append( view.render().el )

  addPanel: ->
    view = new Views.Projects.New(collection: @collection)
    $(@el).prepend view.render().el

  render: ->
    @addPanel()
    @
