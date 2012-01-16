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
    Base.Tools.updateButtonStatus()

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
    'click #save_bio_items' : 'saveAll'

  initialize: ->
    @items = @model.items
    @items.bind('add', @addOne, @)
    _.bindAll @, 'addOne', 'addAll', 'saveOne', 'saveAll'

  addAll: ->
    @items.each @addOne

  addOne: (item) ->
    view = new Views.BioItems.Edit(model: item)
    @$('.bios_items_edit').prepend view.render().el

  addItem: ->
    model = new Andriybazyuta.Models.BioItem
    model.collection = @items

    model.save {eventedAt : Date.parse('today').toString('MM-dd-yyyy'), description: 'Edit please'},
      success: (model, response) =>
        @items.add response

      error: (model, errors) =>
        console.log errors

  saveAll: ->
    @items.each @saveOne

  saveOne: (item)->
    item.save @itemUpdateAttributes(item.get('_id')),
      success: (i) =>
        item.set i

  itemUpdateAttributes: (id)->
    eventedAt : Date.parse(@$("input[name='eventedAt[#{id}]']").val()).toString('MM-dd-yyyy')
    description: @$("input[name='description[#{id}]']").val()
	

  render: ->
    $(@el).html @template.render(model: @model)
    @addAll()
    @
