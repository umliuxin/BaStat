class PlayersController < ApplicationController
  def index
    @players = Player.all
  end
  def show
    @player = Player.build(params[:id])
    # @player = Player.find(params[:id])
    # @player.avg_stat_current_season = @player.current_season_avg_stat
    # @player.avg_stat_seasons = @player.seasons_avg_stat
    # @player.games_current_season = @player.current_season_games
  end
end
