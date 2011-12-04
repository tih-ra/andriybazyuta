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
    EditModal.prototype.events = {
      'click .close': 'onClose'
    };
    EditModal.prototype.onClose = function() {
      this.model.trigger('edit:modal', false);
      this.model.trigger('attach:uploader', false);
      this.model.unbind('attach:uploader');
      return $(this.el).remove();
    };
    EditModal.prototype.tabUpload = function() {
      var view;
      view = new Views.Projects.TabUpload({
        model: this.model
      });
      return this.$('.pill-content').append(view.render().el);
    };
    EditModal.prototype.tabEdit = function() {
      var view;
      view = new Views.Projects.TabEdit({
        model: this.model
      });
      return this.$('.pill-content').append(view.render().el);
    };
    EditModal.prototype.render = function() {
      $(this.el).html(this.template.render());
      $(document.body).append(this.el);
      this.$('.tabs').tabs();
      this.tabEdit();
      this.tabUpload();
      this.model.trigger('edit:modal', true);
      this.model.trigger('attach:uploader', true);
      return this;
    };
    return EditModal;
  })();
  Views.Projects.TabEdit = (function() {
    __extends(TabEdit, Backbone.View);
    function TabEdit() {
      TabEdit.__super__.constructor.apply(this, arguments);
    }
    TabEdit.prototype.template = Templates['projects.tab_edit'];
    TabEdit.prototype.id = 'tab_edit';
    TabEdit.prototype.className = 'active';
    TabEdit.prototype.events = {
      'click #save_edited': 'save'
    };
    TabEdit.prototype.save = function() {
      this.model.set(this.updateAttributes());
      return this.model.save(this.updateAttributes(), {
        success: __bind(function(model) {
          return console.log(model);
        }, this)
      });
    };
    TabEdit.prototype.updateAttributes = function() {
      return {
        title: this.$('input[name="title"]').val(),
        description: this.$('textarea[name="description"]').val()
      };
    };
    TabEdit.prototype.render = function() {
      $(this.el).html(this.template.render({
        model: this.model
      }));
      return this;
    };
    return TabEdit;
  })();
  Views.Projects.TabUpload = (function() {
    __extends(TabUpload, Backbone.View);
    function TabUpload() {
      TabUpload.__super__.constructor.apply(this, arguments);
    }
    TabUpload.prototype.template = Templates['projects.tab_upload'];
    TabUpload.prototype.id = 'tab_upload';
    TabUpload.prototype.statuses = ['queued', 'uploading', 'danger', 'info'];
    TabUpload.prototype.initialize = function() {
      return this.model.bind('attach:uploader', this.loading, this);
    };
    TabUpload.prototype.loading = function(state) {
      if (state) {
        return this.attachUploader("/projects/" + (this.model.get('_id')) + "/items");
      } else {
        return this.removeUploader();
      }
    };
    TabUpload.prototype.attachUploader = function(path) {
      return this.uploader = new Base.Tools.uploader(path, this);
    };
    TabUpload.prototype.removeUploader = function() {
      return this.uploader.destroy();
    };
    TabUpload.prototype.render = function() {
      $(this.el).html(this.template.render());
      return this;
    };
    TabUpload.prototype.filesAdded = function(files) {
      return _(files).each(__bind(function(file) {
        var view;
        view = new Views.Shared.Progress({
          file: file
        });
        return this.$('.upload').append(view.render().el);
      }, this));
    };
    TabUpload.prototype.setState = function(file) {
      return $("#" + file.id + " > div").css({
        width: "" + file.percent + "%"
      });
    };
    TabUpload.prototype.setPercent = function(file) {};
    TabUpload.prototype.setStatus = function(file) {
      var status;
      status = this.statuses[file.status - 2];
      return $("#" + file.id).addClass(status);
    };
    TabUpload.prototype.addItem = function(file) {
      var model;
      model = new Andriybazyuta.Models.Item;
      model.set({
        file: file
      });
      return this.model.items.add(model);
    };
    return TabUpload;
  })();
}).call(this);
