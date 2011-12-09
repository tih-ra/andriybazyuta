Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates


class Views.VimeoVideos.Video extends Backbone.View
  template: Templates['vimeo_videos.video']

  className: 'vimeo_video'

  ready: (player) ->
    $f(player).api('setColor', 'c0c0c0')
  
  addVideo: ->
    video = @make 'iframe', {id: "player_#{@model.get('id')}", src: "http://player.vimeo.com/video/#{@model.get('id')}?api=1&player_id=player_#{@model.get('id')}", width: 530, height: 300, frameborder: 0}

    _this = @

    @$('.accordionContent').hide().html(video).slideDown 'slow', ->
      $f(video).addEvent('ready', _this.ready)
    		
  render: ->
    $(@el).html @template.render(model: @model)
    @addVideo()
    Base.Tools.accordion(@$('.accordionButton'), @$('.accordionContent'))    
    @
