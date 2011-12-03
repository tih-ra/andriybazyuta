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
  Views.Projects.New = (function() {
    __extends(New, Backbone.View);
    function New() {
      New.__super__.constructor.apply(this, arguments);
    }
    New.prototype.template = Templates['projects.panel'];
    New.prototype.className = 'row';
    New.prototype.events = {
      'click #new_project': 'new'
    };
    New.prototype["new"] = function(e) {
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
    New.prototype.attributes = function() {
      return {
        title: 'VIEOMUSIC',
        body: 'Some body',
        description: 'Some description'
      };
    };
    New.prototype.render = function() {
      $(this.el).html(this.template.render());
      return this;
    };
    return New;
  })();
}).call(this);
