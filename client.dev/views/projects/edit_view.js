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
  Views.Projects.Edit = (function() {
    __extends(Edit, Backbone.View);
    function Edit() {
      Edit.__super__.constructor.apply(this, arguments);
    }
    Edit.prototype.template = Templates['projects.edit'];
    Edit.prototype.className = 'row';
    Edit.prototype.initialize = function() {
      return this.model.bind('add_items_button_mode', (function(state) {
        return this.$('#add_items').button(state);
      }), this);
    };
    Edit.prototype.events = {
      'click #delete_project': 'delete',
      'click #add_items': 'addItems'
    };
    Edit.prototype.addItems = function() {
      var view;
      view = new Views.Projects.EditModal({
        model: this.model
      });
      $(view.render().el).modal('show');
      return view.attachUploader("/projects/" + (this.model.get('_id')) + "/items");
    };
    Edit.prototype["delete"] = function() {
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
    Edit.prototype.render = function() {
      $(this.el).html(this.template.render());
      return this;
    };
    return Edit;
  })();
}).call(this);
