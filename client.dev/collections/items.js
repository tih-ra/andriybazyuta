(function() {
  var Models;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  Models = Andriybazyuta.Models;
  Andriybazyuta.Collections.Items = (function() {
    __extends(Items, Backbone.Collection);
    function Items() {
      Items.__super__.constructor.apply(this, arguments);
    }
    Items.prototype.model = Models.Item;
    Items.prototype.initialize = function(collection, options) {
      return this.url = options.url;
    };
    return Items;
  })();
}).call(this);
