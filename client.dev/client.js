(function() {
  var app;
  app = window['Andriybazyuta'] = {};
  app.Collections = {};
  app.Models = {};
  app.Routers = {};
  app.Templates = {};
  app.Views = {};
  $(document).ready(function() {
    var k, router, _ref;
    _ref = app.Routers;
    for (k in _ref) {
      router = _ref[k];
      if (k !== 'Root') {
        app.Routers[k] = new router;
      }
    }
    app.Routers.Root = new app.Routers.Root;
    return Backbone.history.start();
  });
}).call(this);
