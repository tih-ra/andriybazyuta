u = require('underscore')
Embeded = module.exports = Embeded = (collection, options) ->
  @collection = collection
  _this = @
  u.filter collection, (v) ->
    return eval('v.' + _this.getKey(options) + '.toString()') is _this.getValue(options).toString()

Embeded:: =
  getKey: (options) ->
    for key in options
      console.log key
      return key

  getValue: (options) ->	
    for key in options
      console.log options[key]
      return options[key]

  object: ->
    

  