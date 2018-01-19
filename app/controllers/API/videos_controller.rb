module API

  class VideosController < ApplicationController
    def query
      render :json => Video.fetchVideo(params)
    end

    def update
    end

    # vid, team, gameday, season

  end
end
