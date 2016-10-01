module API
  class GamesController < ApplicationController
    def index
      if params.has_key?(:type) && params[:type] == GAME_TYPE_SCHEDULE
        games = Game.schedule_game
        render :json => games, include:['season']
      elsif params.has_key?(:type) && params[:type] == GAME_TYPE_RESULT
        games = Game.result_game
        render :json => games, include:['players','season','team_stat','oppo_team_stat','score','actions','player_stats']
      elsif params.has_key?(:type) && params[:type] == GAME_TYPE_UNTRACK
        games = Game.untrack_game
        render :json => games, include:['players','season']
      else
        games = Game.all
        render :json => games, include:['players','season']
      end
    end

    def show
      game = Game.find(params[:id])
      render :json => game
    end

  end
end
