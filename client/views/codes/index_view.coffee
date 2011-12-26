Templates = Andriybazyuta.Templates
Views = Andriybazyuta.Views

class Views.Codes.Index extends Backbone.View
  template: Templates['codes.index']

  initialize: ->
    @collection = new Andriybazyuta.Collections.Codes
    _.bindAll @, 'addOne', 'addAll'
    @collection.bind('add', @addOne, @)
    @collection.bind('reset', @addAll, @)
    @collection.fetch()

  addAll: ->
    @collection.each(@addOne)
    @addPanel() if Andriybazyuta.Sessions.logged_in()

  addOne: (code)->
    view = new Views.Codes.Code(model: code)
    @$('#codes').prepend( view.render().el )

  addPanel: ->
    view = new Views.Codes.New(collection: @collection)
    @$('#panel').html(view.render().el)

  render: ->
    $(@el).html @template.render()
     
    @
