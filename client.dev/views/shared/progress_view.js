(function() {
  var Templates, Views;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  Views = Andriybazyuta.Views;
  Templates = Andriybazyuta.Templates;
  Views.Shared.Progress = (function() {
    __extends(Progress, Backbone.View);
    function Progress() {
      Progress.__super__.constructor.apply(this, arguments);
    }
    Progress.prototype.template = Templates['shared.progress'];
    Progress.prototype.className = 'progress';
    Progress.prototype.initialize = function(options) {
      this.file = options.file;
      return $(this.el).attr('id', this.file.id);
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
