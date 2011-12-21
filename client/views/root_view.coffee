Root = Andriybazyuta.Views.Root = {}
Projects = Andriybazyuta.Views.Projects = {}
Shared = Andriybazyuta.Views.Shared = {}
Items = Andriybazyuta.Views.Items = {}
VimeoVideos = Andriybazyuta.Views.VimeoVideos = {}
Embeds = Andriybazyuta.Views.Embeds = {}
Videos = Andriybazyuta.Views.Videos = {}
Main = Andriybazyuta.Views.Main = {}

Views = Andriybazyuta.Views

Templates = Andriybazyuta.Templates

# declaring the layout class
class Root.Layout extends Backbone.View
  className: 'container'
  template: Templates['root.layout']
  events:
    'click .menu_item' : 'menuSelect'
  
  initialize: ->
    $(@el).html @template.render()
    $(document.body).html @el
    

  menuSelect: (e)->
    @$('.menu_item').removeClass('selected')
    $(e.toElement).addClass('selected')

  index: ->
    view = new Views.Root.Index
    $('#root').html view.render().el

  projects: ->
    view = new Views.Projects.Index
    $('#root').html view.render().el

class Root.Index extends Backbone.View
  template: Templates['root.index']
  className: 'row'

  initialize: ->
    @model = new Andriybazyuta.Models.Main
    @model.bind('change', @addMainPage, @)
    @model.fetch()

    Andriybazyuta.Sessions.bind('reset', @initEditPanel, @)
		  

  addMainPage: ->
    view = new Views.Root.Main(model: @model)
    @$('#main_page_wrapper').html view.render(model: @model).el

  addEditPanel: ->
    view = new Views.Main.Edit(model: @model)
    $(@el).prepend view.render().el
	
  initEditPanel: ->
    @addEditPanel() if Andriybazyuta.Sessions.logged_in()
  
  render: ->
    $(@el).html @template.render()
    @initEditPanel()
    @

class Root.Main extends Backbone.View
  template: Templates['root.main']
  className: 'row'

  render: ->
    $(@el).html @template.render(model: @model)
    @
