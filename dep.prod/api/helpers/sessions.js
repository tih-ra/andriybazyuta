(function() {
  exports.logged_in = function(req, res) {
    if (req.session.vimeo) {
      return true;
    } else {
      return false;
    }
  };
  exports.auth_required = function(req, res, callback) {
    if (req.session.vimeo) {
      return callback(true);
    } else {
      res.send('Authentication required', 401);
      return callback(false);
    }
  };
}).call(this);
