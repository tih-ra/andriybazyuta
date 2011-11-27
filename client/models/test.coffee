# decalring the class
class Andriybazyuta.Models.Test extends Backbone.Model
    url: -> "/tests/#{@get('id')}"

    # return false if validates correctly, else returns a value (or some)
    validate: (attr) ->
        #return 'Error: Validation Failed!'
        return false