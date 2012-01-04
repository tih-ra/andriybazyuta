Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

	
class Views.Bios.New extends Backbone.View
  template: Templates['bios.new']
  className: 'row'
  events:
    'click #new_bio' : 'new'

  new: (e) ->
    e.preventDefault()

    model = new Andriybazyuta.Models.Bio

    model.save @attributes(),
      success: (model, response) =>
        @collection.add response

      error: (model, errors) =>
        console.log errors

  attributes: ->
    title: 'Edit Please'
    body: ''	

  render: ->
    $(@el).html @template.render()
    @