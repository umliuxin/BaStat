class PlayersController < ApplicationController
  def index
    @players = Player.all
  end
  def show
    @player = Player.find(params[:id])
    ap '_________'
    ap @player.seasons_avg_stat
  end
end
