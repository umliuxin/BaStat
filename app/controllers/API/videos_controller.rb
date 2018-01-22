module API
  class VideosController < ApplicationController
    def query
      if params[:vid].present?
        render :json => Video.fetchVideo(params)
      else
        render :json => Video.fetchVideos(params)
      end
    end

    def post
      videos = ActiveSupport::JSON.decode(params[:videos])
      Video.postVideos(videos)
      redirect_to videos_path
    end


  end
end
