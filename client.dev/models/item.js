(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  Andriybazyuta.Models.Item = (function() {
    __extends(Item, Backbone.Model);
    function Item() {
      Item.__super__.constructor.apply(this, arguments);
    }
    Item.prototype.defaults = {
      file: null
    };
    Item.prototype.toJSON = function() {
      return {
        file: this.get('file'),
        _id: this.get('_id')
      };
    };
    Item.prototype.file_url = function(version) {
      return "" + this.collection.url + "/item/" + version + "/" + (this.get('file'));
    };
    return Item;
  })();
}).call(this);
