Templates = Andriybazyuta.Templates
Views = Andriybazyuta.Views

class Views.Bios.Index extends Backbone.View
  template: Templates['bios.index']

  initialize: ->
    @collection = new Andriybazyuta.Collections.Bios
    _.bindAll @, 'addOne', 'addAll'
    @collection.bind('add', @addOne, @)
    @collection.bind('reset', @addAll, @)
    @collection.fetch()

  addAll: ->
    @collection.each(@addOne)
    @addPanel() #if Andriybazyuta.Sessions.logged_in()

  addOne: (bio)->
    view = new Views.Bios.Bio(model: bio)
    @$('#bios').prepend( view.render().el )

  addPanel: ->
    view = new Views.Bios.New(collection: @collection)
    @$('#panel').html(view.render().el)

  render: ->
    $(@el).html @template.render()
    
    @
