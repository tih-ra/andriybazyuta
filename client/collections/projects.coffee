# aliasing Andriybazyuta.Models (global) as Models (scoped) - this, ofcourse, is optional
Models = Andriybazyuta.Models

# decalring the class
class Andriybazyuta.Collections.Projects extends Backbone.Collection
  model: Models.Project
  url: '/projects'

  getTopProjects: ->
    projects = _.last @models, 3
    _(_.rest(projects)).each (project) -> project.class = 'offset1'
    return projects