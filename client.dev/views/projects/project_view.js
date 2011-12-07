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
  Views.Projects.Project = (function() {
    __extends(Project, Backbone.View);
    function Project() {
      Project.__super__.constructor.apply(this, arguments);
    }
    Project.prototype.template = Templates['projects.project'];
    Project.prototype.className = 'project';
    Project.prototype.initialize = function() {
      this.model.bind('destroy', this.remove, this);
      this.model.bind('change', this.onChange, this);
      return this.model.items.bind('add', this.addItemsPreview, this);
    };
    Project.prototype.addEditPanel = function() {
      var view;
      view = new Views.Projects.Edit({
        model: this.model
      });
      return $(this.el).append(view.render().el);
    };
    Project.prototype.addItemsPreview = function() {
      var view;
      view = new Views.Items.Preview({
        collection: this.model.items
      });
      return this.$('.items_preview').html(view.render().el);
    };
    Project.prototype.onChange = function() {
      this.render();
      return this.model.trigger('edit:modal', true);
    };
    Project.prototype.remove = function() {
      return $(this.el).remove();
    };
    Project.prototype.render = function() {
      $(this.el).html(this.template.render({
        model: this.model
      }));
      this.addItemsPreview();
      this.addEditPanel();
      return this;
    };
    return Project;
  })();
}).call(this);
