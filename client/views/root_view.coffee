Root = Andriybazyuta.Views.Root = {}
Projects = Andriybazyuta.Views.Projects = {}
Shared = Andriybazyuta.Views.Shared = {}
Items = Andriybazyuta.Views.Items = {}
VimeoVideos = Andriybazyuta.Views.VimeoVideos = {}
Embeds = Andriybazyuta.Views.Embeds = {}
Videos = Andriybazyuta.Views.Videos = {}


Views = Andriybazyuta.Views

Templates = Andriybazyuta.Templates

# declaring the layout class
class Root.Layout extends Backbone.View
  className: 'container'
  template: Templates['root.layout']
  
  initialize: ->
    $(@el).html @template.render()
    $(document.body).html @el

  index: ->
    view = new Views.Root.Index
    $('#root').html view.render().el

  projects: ->
    view = new Views.Projects.Index
    $('#root').html view.render().el

class Root.Index extends Backbone.View
  template: Templates['root.index']
  className: 'row'
  
  render: ->
    $(@el).html @template.render()
    @
