(function() {
  var SharedUploader, Templates;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  }, __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  SharedUploader = Andriybazyuta.Views.SharedUploader = {};
  Templates = Andriybazyuta.Templates;
  SharedUploader.New = (function() {
    __extends(New, Backbone.View);
    function New() {
      New.__super__.constructor.apply(this, arguments);
    }
    New.prototype.template = Templates['shared_uploader.new'];
    New.prototype.className = 'modal hide fade';
    New.prototype.events = {
      'click .close': 'onClose'
    };
    New.prototype.onClose = function() {
      this.model.trigger('add_items_button_mode', 'reset');
      this.removeUploader();
      return $(this.el).remove();
    };
    New.prototype.attachUploader = function(path) {
      return this.uploader = Base.Tools.uploader(path, this);
    };
    New.prototype.removeUploader = function() {
      return this.uploader.destroy();
    };
    New.prototype.render = function() {
      $(this.el).html(this.template.render());
      this.model.trigger('add_items_button_mode', 'loading');
      return this;
    };
    New.prototype.filesAdded = function(files) {
      return _(files).each(__bind(function(file) {
        var view;
        view = new SharedUploader.Progress({
          file: file
        });
        return this.$('.modal-body').append(view.render().el);
      }, this));
    };
    New.prototype.setState = function(file) {
      return $("#" + file.id).css({
        width: "" + file.percent + "%"
      });
    };
    New.prototype.setPercent = function(file) {
      return console.log(file.percent);
    };
    return New;
  })();
  SharedUploader.Progress = (function() {
    __extends(Progress, Backbone.View);
    function Progress() {
      Progress.__super__.constructor.apply(this, arguments);
    }
    Progress.prototype.template = Templates['shared_uploader.progress'];
    Progress.prototype.className = 'progress';
    Progress.prototype.initialize = function(options) {
      return this.file = options.file;
    };
    Progress.prototype.render = function() {
      $(this.el).html(this.template.render({
        file: this.file
      }));
      console.log(this.template);
      return this;
    };
    return Progress;
  })();
}).call(this);
