# aliasing Andriybazyuta.Views.Root (global) as Views (scoped) - this, ofcourse, is optional
Views = Andriybazyuta.Views.Root

# decalring the class
class Andriybazyuta.Routers.Root extends Backbone.Router
  routes:
    '/*' : 'index'
    'projects' : 'projects'

  initialize: ->
    @view = new Views.Layout
    @sessions = new Andriybazyuta.Collections.Sessions

    @sessions.bind('reset', @addSessions, @)
    @sessions.fetch()

  addSessions: ->
    Andriybazyuta.Sessions = @sessions
        
  index: ->
    @view.index()

  projects: ->
    @view.projects()
    
    # example of another method within the router
    #about: ->
        #console.log 'Root.about() was called upon!'
        #new Views.About