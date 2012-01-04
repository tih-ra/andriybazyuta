exports.logged_in = (req, res) ->
  return if req.session.vimeo then true else false

exports.auth_required = (req, res, callback) ->
  if req.session.vimeo
    return callback(true)
  else
    #res.send('Authentication required', 401)
    return callback(true) #FIX TO FALSE
    