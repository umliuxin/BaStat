class PlayersController < ApplicationController
  def index
    add_breadcrumb "Home", home_path, :title => "Home"
    add_breadcrumb "Players", players_path, :title => "Players"
    @players = Player.all
  end
  def show
    @player = Player.build(params[:id])
    add_breadcrumb "Home", home_path, :title => "Home"
    add_breadcrumb "Players", players_path, :title => "Players"
    add_breadcrumb "#{@player.name}", player_path(@player), :title => "Name"

  end
end
