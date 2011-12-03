(function() {
  var Templates, Views;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  }, __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  Views = Andriybazyuta.Views;
  Templates = Andriybazyuta.Templates;
  Views.Projects.EditModal = (function() {
    __extends(EditModal, Backbone.View);
    function EditModal() {
      EditModal.__super__.constructor.apply(this, arguments);
    }
    EditModal.prototype.template = Templates['projects.edit_modal'];
    EditModal.prototype.className = 'modal hide fade';
    EditModal.prototype.statuses = ['queued', 'uploading', 'danger', 'info'];
    EditModal.prototype.events = {
      'click .close': 'onClose'
    };
    EditModal.prototype.onClose = function() {
      this.model.trigger('add_items_button_mode', 'reset');
      this.removeUploader();
      return $(this.el).remove();
    };
    EditModal.prototype.attachUploader = function(path) {
      return this.uploader = Base.Tools.uploader(path, this);
    };
    EditModal.prototype.removeUploader = function() {
      return this.uploader.destroy();
    };
    EditModal.prototype.render = function() {
      $(this.el).html(this.template.render());
      this.model.trigger('add_items_button_mode', 'loading');
      return this;
    };
    EditModal.prototype.filesAdded = function(files) {
      return _(files).each(__bind(function(file) {
        var view;
        view = new Views.Shared.Progress({
          file: file
        });
        return this.$('.modal-body').append(view.render().el);
      }, this));
    };
    EditModal.prototype.setState = function(file) {
      return $("#" + file.id + " > div").css({
        width: "" + file.percent + "%"
      });
    };
    EditModal.prototype.setPercent = function(file) {};
    EditModal.prototype.setStatus = function(file) {
      var status;
      status = this.statuses[file.status - 2];
      return $("#" + file.id).addClass(status);
    };
    EditModal.prototype.addItem = function(file) {
      var model;
      model = new Andriybazyuta.Models.Item;
      model.set({
        file: file
      });
      return this.model.items.add(model);
    };
    return EditModal;
  })();
}).call(this);
