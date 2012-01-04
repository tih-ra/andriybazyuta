# aliasing Andriybazyuta.Views.Root (global) as Views (scoped) - this, ofcourse, is optional
Views = Andriybazyuta.Views.Root

# decalring the class
class Andriybazyuta.Routers.Root extends Backbone.Router
  routes:
    '/*' : 'index'
    'projects' : 'projects'
    'codes' : 'codes'
    'bio' : 'bios'

  initialize: ->
    @view = new Views.Layout
    Andriybazyuta.Sessions = new Andriybazyuta.Collections.Sessions
#    @sessions.bind('reset', @addSessions, @)
        
  index: ->
    @view.index()

  projects: ->
    @view.projects()

  codes: ->
    @view.codes()

  bios: ->
    @view.bios()

    # example of another method within the router
    #about: ->
        #console.log 'Root.about() was called upon!'
        #new Views.About