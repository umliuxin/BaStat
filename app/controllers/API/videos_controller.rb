module API
  class VideosController < ApplicationController
    def query
      render :json => Video.fetchVideo(params)
    end

    def post
      videos = ActiveSupport::JSON.decode(params[:videos])
      Video.postVideos(videos)
      redirect_to videos_path
    end


  end
end
