Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

	
class Views.Projects.New extends Backbone.View
  template: Templates['projects.new']
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