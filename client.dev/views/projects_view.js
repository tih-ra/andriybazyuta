(function() {
  var Projects, Templates;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  }, __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  Projects = Andriybazyuta.Views.Projects = {};
  Templates = Andriybazyuta.Templates;
  Projects.Index = (function() {
    __extends(Index, Backbone.View);
    function Index() {
      Index.__super__.constructor.apply(this, arguments);
    }
    Index.prototype.id = 'projects';
    Index.prototype.initialize = function() {
      this.collection = new Andriybazyuta.Collections.Projects;
      _.bindAll(this, 'addOne', 'addAll');
      this.collection.bind('add', this.addOne, this);
      this.collection.bind('reset', this.addAll, this);
      return this.collection.fetch();
    };
    Index.prototype.addAll = function() {
      return this.collection.each(this.addOne);
    };
    Index.prototype.addOne = function(project) {
      var view;
      view = new Projects.Project({
        model: project
      });
      return $(this.el).append(view.render().el);
    };
    Index.prototype.addPanel = function() {
      var view;
      view = new Projects.Panel({
        collection: this.collection
      });
      return $(this.el).prepend(view.render().el);
    };
    Index.prototype.render = function() {
      this.addPanel();
      return this;
    };
    return Index;
  })();
  Projects.Project = (function() {
    __extends(Project, Backbone.View);
    function Project() {
      Project.__super__.constructor.apply(this, arguments);
    }
    Project.prototype.template = Templates['projects.project'];
    Project.prototype.className = 'project';
    Project.prototype.initialize = function() {
      return this.model.bind('destroy', this.remove, this);
    };
    Project.prototype.addProjectPanel = function() {
      var view;
      view = new Projects.ProjectPanel({
        model: this.model
      });
      return $(this.el).append(view.render().el);
    };
    Project.prototype.remove = function() {
      return $(this.el).remove();
    };
    Project.prototype.render = function() {
      $(this.el).html(this.template.render({
        model: this.model
      }));
      this.addProjectPanel();
      return this;
    };
    return Project;
  })();
  Projects.ProjectPanel = (function() {
    __extends(ProjectPanel, Backbone.View);
    function ProjectPanel() {
      ProjectPanel.__super__.constructor.apply(this, arguments);
    }
    ProjectPanel.prototype.template = Templates['projects.project_panel'];
    ProjectPanel.prototype.className = 'row';
    ProjectPanel.prototype.initialize = function() {
      return this.model.bind('add_items_button', (function(state) {
        return this.$('#add_items').button(state);
      }), this);
    };
    ProjectPanel.prototype.events = {
      'click #delete_project': 'delete',
      'click #add_items': 'items_new'
    };
    ProjectPanel.prototype.items_new = function() {
      var view;
      view = new Andriybazyuta.Views.ProjectItems.New({
        model: this.model
      });
      return $(view.render().el).modal('show');
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
  Projects.Panel = (function() {
    __extends(Panel, Backbone.View);
    function Panel() {
      Panel.__super__.constructor.apply(this, arguments);
    }
    Panel.prototype.template = Templates['projects.panel'];
    Panel.prototype.className = 'row';
    Panel.prototype.events = {
      'click #new_project': 'new'
    };
    Panel.prototype["new"] = function(e) {
      var model;
      e.preventDefault();
      model = new Andriybazyuta.Models.Project;
      return model.save(this.attributes(), {
        success: __bind(function(model, response) {
          return this.collection.add(response);
        }, this),
        error: __bind(function(model, errors) {
          return console.log(errors);
        }, this)
      });
    };
    Panel.prototype.attributes = function() {
      return {
        title: 'VIEOMUSIC',
        body: 'Some body',
        description: 'Some description'
      };
    };
    Panel.prototype.render = function() {
      $(this.el).html(this.template.render());
      return this;
    };
    return Panel;
  })();
}).call(this);
