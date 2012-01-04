Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates

class Views.Bios.EditModal extends Backbone.View
  template: Templates['bios.edit_modal']
  className: 'modal hide fade'

  onClose: ->
    @model.trigger('edit:modal', false)

    $(@el).remove()

  tabEdit: ->
    view = new Views.Bios.TabEdit(model: @model)
    @$('.pill-content').append(view.render().el)

  tabItems: ->
    view = new Views.Bios.TabItems(model: @model)
    @$('.pill-content').append(view.render().el)


  render: ->
    $(@el).html @template.render(model: @model)

    _this = @
    $(@el).bind 'hidden', -> _this.onClose()

    $(document.body).append @el

    @$('.tabs').tabs()
    @tabEdit()
    @tabItems()   
    
    @model.trigger('edit:modal', true)
    
    @

class Views.Bios.TabEdit extends Backbone.View
  template: Templates['bios.tab_edit']
  id: 'tab_edit'
  className: 'active'

  events:
    'click #save_edited' : 'save'

  save: ->
    @model.set @updateAttributes()
    @model.save @updateAttributes(),
      success: (model) =>
        console.log(model)

  updateAttributes: ->
    title: @$('input[name="title"]').val()
    body: @$('textarea[name="body"]').val()

  render: ->
    $(@el).html @template.render(model: @model)
    @	

class Views.Bios.TabItems extends Backbone.View
  template: Templates['bios.tab_items']
  id: 'tab_items'

  events:
    'click #add_bio_item' : 'addItem'

  initialize: ->
    @items = @model.items

  addAll: ->
    @items.each @addOne

  addOne: (item) ->
    view = new Views.BioItems.Edit(model: item)
    @$('#bios_items_wrapper').prepend view.render().el

  addItem: ->
    console.log 'here'
    model = new Andriybazyuta.Models.BioItem
    model.collection = @items

    model.save {date : Date.now},
      success: (model, response) =>
        @items.add response

      error: (model, errors) =>
        console.log errors

  render: ->
    $(@el).html @template.render(model: @model)
    @addAll()
    @
