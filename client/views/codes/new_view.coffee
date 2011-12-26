Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

	
class Views.Codes.New extends Backbone.View
  template: Templates['codes.new']
  className: 'row'
  events:
    'click #new_code' : 'new'

  new: (e) ->
    e.preventDefault()

    model = new Andriybazyuta.Models.Code

    model.save @attributes(),
      success: (model, response) =>
        @collection.add response

      error: (model, errors) =>
        console.log errors

  attributes: ->
    title: 'Edit Please'
    body: ''
    description: ''
    link: ''
    languages: ''
	

  render: ->
    $(@el).html @template.render()
    @