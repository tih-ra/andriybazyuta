(function() {
  var ProjectItems, Templates;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  ProjectItems = Andriybazyuta.Views.ProjectItems = {};
  Templates = Andriybazyuta.Templates;
  ProjectItems.New = (function() {
    __extends(New, Backbone.View);
    function New() {
      New.__super__.constructor.apply(this, arguments);
    }
    New.prototype.template = Templates['project_items.new'];
    New.prototype.className = 'modal hide fade';
    New.prototype.events = {
      'click .close': 'reset_add_items_button'
    };
    New.prototype.reset_add_items_button = function() {
      return this.model.trigger('add_items_button', 'reset');
    };
    New.prototype.render = function() {
      $(this.el).html(this.template.render());
      this.model.trigger('add_items_button', 'loading');
      return this;
    };
    return New;
  })();
}).call(this);
