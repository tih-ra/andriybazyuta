Views = Andriybazyuta.Views

Templates = Andriybazyuta.Templates

class Views.Shared.Uploader extends Backbone.View

  statuses: ['queued', 'uploading', 'danger', 'info'] 

  initialize: (options) ->
    @model = options.model
    @parent = options.parent
    @path = options.path
    @button = options.button ||= 'upload_item_file'

    @model.bind 'attach:uploader', @loading, @

  loading: (state) ->
    if state then @attachUploader(@path) else @removeUploader()  

  attachUploader: (path) ->
    @uploader = new Base.Tools.uploader(path, @, @parent, @button)

  removeUploader: ->
    @uploader.destroy()

  render: ->
    @

  filesAdded: (files) ->
    _(files).each (file) =>
      view = new Views.Shared.Progress({file: file})

      $(@el).append(view.render().el)

  setState: (file) ->
    $("##{file.id} > div").css(width: "#{file.percent}%")

  setPercent: (file) ->
    #message = I18n.t('editor.items.new_file.percent', percent: "#{file.percent} %")

  setStatus: (file) ->
    status = @statuses[file.status - 2]
    $("##{file.id}").addClass(status)
