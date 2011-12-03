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
  Views.Projects.ProjectPanel = (function() {
    __extends(ProjectPanel, Backbone.View);
    function ProjectPanel() {
      ProjectPanel.__super__.constructor.apply(this, arguments);
    }
    ProjectPanel.prototype.template = Templates['projects.project_panel'];
    ProjectPanel.prototype.className = 'row';
    ProjectPanel.prototype.initialize = function() {
      return this.model.bind('add_items_button_mode', (function(state) {
        return this.$('#add_items').button(state);
      }), this);
    };
    ProjectPanel.prototype.events = {
      'click #delete_project': 'delete',
      'click #add_items': 'addItems'
    };
    ProjectPanel.prototype.addItems = function() {
      var view;
      view = new Views.SharedUploader.New({
        model: this.model
      });
      $(view.render().el).modal('show');
      return view.attachUploader("/projects/" + (this.model.get('_id')) + "/items");
    };
    ProjectPanel.prototype["delete"] = function() {
      this.model.destroy({
        success: function(model, response) {
          return console.log(response);
        },
        error: function(model, errors) {
          return console.log(errors);
        }
      });
      return Backbone.sync('delete', this.model);
    };
    ProjectPanel.prototype.render = function() {
      $(this.el).html(this.template.render());
      return this;
    };
    return ProjectPanel;
  })();
}).call(this);
