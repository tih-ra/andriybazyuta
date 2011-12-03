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
    console.log @model
    $(@el).append view.render().el
  
  addItemsPreview: ->
    view = new Andriybazyuta.Views.Items.ProjectPreview(collection: @model.items)
    @$('.items_preview').html view.render().el

  remove: ->
    $(@el).remove()

  render: ->
    $(@el).html @template.render(model: @model)
    @addItemsPreview()
    @addProjectPanel()
    @

class Projects.ProjectPanel extends Backbone.View
  template: Templates['projects.project_panel']
  className: 'row'

  initialize: ->
    @model.bind 'add_items_button_mode', (( state ) -> 
      @$('#add_items').button( state )), @


  events:
    'click #delete_project' : 'delete'
    'click #add_items' : 'addItems'

  addItems: ->
    view = new Andriybazyuta.Views.SharedUploader.New(model: @model)
    $(view.render().el).modal('show')
    view.attachUploader("/projects/#{@model.get('_id')}/items")
    
  
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