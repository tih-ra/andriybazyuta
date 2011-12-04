window.Base = {}
@Base.Tools =
  
  uploader: (path, object) ->
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
      object.addItem(response.response)

    return uploader

  