Projects = Andriybazyuta.Views.Projects = {}

Templates = Andriybazyuta.Templates

class Projects.Index extends Backbone.View
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
    view = new Projects.Project(model: project)
    $(@el).append( view.render().el )

  addPanel: ->
    view = new Projects.Panel(collection: @collection)
    $(@el).prepend view.render().el

  render: ->
    @addPanel()
    @

class Projects.Project extends Backbone.View
  template: Templates['projects.project']
  className: 'project'

  initialize: ->
    @model.bind 'destroy', @remove, @
  
  addProjectPanel: ->
    view = new Projects.ProjectPanel(model: @model)
    $(@el).append view.render().el

  remove: ->
    $(@el).remove()

  render: ->
    $(@el).html @template.render(model: @model)
    @addProjectPanel()
    @

class Projects.ProjectPanel extends Backbone.View
  template: Templates['projects.project_panel']
  className: 'row'

  initialize: ->
    @model.bind 'add_items_button', (( state ) -> 
      @$('#add_items').button( state )), @


  events:
    'click #delete_project' : 'delete'
    'click #add_items' : 'items_new'

  items_new: ->
    view = new Andriybazyuta.Views.ProjectItems.New(model: @model)
    $(view.render().el).modal('show')

  delete: ->
    @model.destroy 
      success: (model, response) ->
        console.log(response)
      error: (model, errors) ->
        console.log(errors)
    Backbone.sync('delete', @model)

  render: ->
    $(@el).html @template.render()
    @	
	
class Projects.Panel extends Backbone.View
  template: Templates['projects.panel']
  className: 'row'
  events:
    'click #new_project' : 'new'

  new: (e) ->
    e.preventDefault()

    model = new Andriybazyuta.Models.Project

    model.save @attributes(),
      success: (model, response) =>
        @collection.add response

      error: (model, errors) =>
        console.log errors

  attributes: ->
    title: 'VIEOMUSIC'
    body: 'Some body'
    description: 'Some description'
	

  render: ->
    $(@el).html @template.render()
    @  