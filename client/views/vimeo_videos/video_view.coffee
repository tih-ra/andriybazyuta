Views = Andriybazyuta.Views
Templates = Andriybazyuta.Templates


class Views.VimeoVideos.Video extends Backbone.View
  template: Templates['video_videos.video']
  className: 'video_video'

  render: ->
    video = @make 'iframe', {src: "http://player.vimeo.com/video/#{@model.get('id')}?api=1&player_id=player_#{@model.get('id')}", width: 530, height: 300, frameborder: 0}
    $(@el).html video
    
    @
