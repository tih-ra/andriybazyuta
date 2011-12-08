Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates


class Views.VimeoVideos.Video extends Backbone.View
  className: 'vimeo_video'

  ready: (player) ->
    $f(player).api('setColor', 'c0c0c0')
    		
  render: ->
    video = @make 'iframe', {id: "player_#{@model.get('id')}", src: "http://player.vimeo.com/video/#{@model.get('id')}?api=1&player_id=player_#{@model.get('id')}", width: 530, height: 300, frameborder: 0}
    _this = @

    $(@el).hide().html(video).slideDown 'slow', ->
      $f(video).addEvent('ready', _this.ready)
    @
