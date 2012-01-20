Templates = Andriybazyuta.Templates
Views = Andriybazyuta.Views

class Views.Projects.Index extends Backbone.View
  template: Templates['projects.index']

  initialize: ->
    @collection = new Andriybazyuta.Collections.Projects
    _.bindAll @, 'addOne', 'addAll'
    @collection.bind('add', @addOne, @)
    @collection.bind('reset', @addAll, @)
#    @collection.bind('all',   @render, @)
    @collection.fetch()

  addAll: ->
    @collection.each(@addOne)
    @addPanel() if Andriybazyuta.Sessions.logged_in()

  addOne: (project)->
    view = new Views.Projects.Project(model: project)
    @$('#projects').prepend( view.render().el )

  addPanel: ->
    view = new Views.Projects.New(collection: @collection)
    @$('#panel').html(view.render().el)

  render: ->
    $(@el).html @template.render()
    @
