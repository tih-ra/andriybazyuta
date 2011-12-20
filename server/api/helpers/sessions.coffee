exports.logged_in = (req, res) ->
  return if req.session.vimeo then true else false