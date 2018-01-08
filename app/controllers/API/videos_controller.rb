module API

  class VideosController < ApplicationController
    def query
      ap params
      render :json => Video.fetchVideo(params)
    end

    def update
    end

    # vid, team, gameday, season

  end
end
