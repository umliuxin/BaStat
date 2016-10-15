module API
  class SeasonsController < ApplicationController
    def index
      seasons = Season.all
      render :json => seasons
    end

    def show
      season = Season.find(params[:id])
      render :json => season
    end

    def players
      season = Season.find(params[:id])
      render :json => season.players
    end

    def games
      season = Season.find(params[:id])
      render :json => season.games
    end
  end
end
