(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  window.Base = {};
  this.Base.Tools = {
    uploader: function(path, object) {
      var uploader;
      uploader = new plupload.Uploader({
        runtimes: 'html5',
        browse_button: 'upload_item_file',
        max_file_size: '50mb',
        url: path,
        file_data_name: 'upload',
        multipart: true
      });
      uploader.init();
      uploader.bind('FilesAdded', __bind(function(up, files) {
        return object.filesAdded(files);
      }, this));
      uploader.bind('UploadFile', __bind(function(up, file) {
        object.setState(file);
        object.setPercent(file);
        return object.setStatus(file);
      }, this));
      uploader.bind('UploadProgress', __bind(function(up, file) {
        object.setState(file);
        object.setPercent(file);
        return object.setStatus(file);
      }, this));
      uploader.bind('FilesAdded', function(up, files) {
        return up.start();
      });
      uploader.bind('FileUploaded', __bind(function(up, file, response) {
        return object.addItem(response.response);
      }, this));
      return uploader;
    }
  };
}).call(this);
