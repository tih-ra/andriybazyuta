window.Base = {}
@Base.Tools =
  
  uploader: (path, object, parent) ->
    uploader = new plupload.Uploader
      runtimes: 'html5'
      browse_button: 'upload_item_file'
      max_file_size: '50mb'
      url: path
      #flash_swf_url: '/assets/plupload.flash.swf'
      file_data_name: 'upload'
      multipart: true
#      multipart_params:
#        'item[itemable_type]': itemable_type
#        'item[itemable_id]': itemable_id
#        'authenticity_token': Arty.Config.csrf_token
#       'session_value': Arty.Config.session_value

    uploader.init()

    uploader.bind 'FilesAdded', (up, files) =>
      object.filesAdded(files)

    uploader.bind 'UploadFile', (up, file) =>
      object.setState(file)
      object.setPercent(file)
      object.setStatus(file)

    uploader.bind 'UploadProgress', (up, file) =>
      object.setState(file)
      object.setPercent(file)
      object.setStatus(file)

    uploader.bind 'FilesAdded', (up, files) ->
      up.start()

    uploader.bind 'FileUploaded', (up, file, response) =>
      parent.addItem(response.response)

    return uploader

  montage: (object, options) ->
    $container = $(object)
    $imgs = $container.find("img").hide()
    totalImgs = $imgs.length
    cnt = 0

    $imgs.each (i) ->
      $img = $(@)
      $("<img/>").load(->
        ++cnt
        if cnt is totalImgs
          $imgs.show()
          $container.montage(
            options
          )
      ).attr "src", $img.attr("src")

  montagePreview: ->
    liquid : true
    margin : 2
    minw : 100
    alternateHeight : true
    alternateHeightRange:
      min : 100
      max : 200
    fillLastRow : true

  montageGallery: ->
    liquid : false
    margin: 4
    minw : 150
    alternateHeight : true
    alternateHeightRange:
      min : 150
      max : 400

  styleTitle: (title) ->
    title_arr = title.split(' ')
    _.flatten( [_(title_arr).initial(), "<span class='dark'>#{_(title_arr).last(1)}</span>"]).join("")

  accordion: (button, content) ->
    $(button).click ->
      $(button).removeClass "on"
      $(content).slideUp "normal"
      if $(this).next().is(":hidden") is true
        $(this).addClass "on"
        $(this).next().slideDown "normal"

    $(button).mouseover(->
      $(this).addClass "over"
    ).mouseout ->
      $(this).removeClass "over"

    $(content).hide()




  