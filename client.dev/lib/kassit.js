(function() {
  window.Kassit = {};
  Kassit.Template = {};
  Kassit.Template.EJS = (function() {
    function EJS(json) {
      this.ejs = new window.EJS({
        text: json
      });
    }
    EJS.prototype.render = function(data) {
      if (data == null) {
        data = {};
      }
      return this.ejs.render(data);
    };
    return EJS;
  })();
  Kassit.Template.KUP = (function() {
    function KUP(json) {
      this.kup = json;
    }
    KUP.prototype.render = function(data, helpers) {
      if (data == null) {
        data = {};
      }
      if (helpers == null) {
        helpers = {};
      }
      return CoffeeKup.render(this.kup, {
        context: data,
        locals: helpers
      });
    };
    return KUP;
  })();
}).call(this);
