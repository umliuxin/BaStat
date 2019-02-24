class PlayersController < ApplicationController
  def index
    add_breadcrumb "Home", home_path, :title => "Home"
    add_breadcrumb "Players", players_path, :title => "Players"

    puts '________'
    puts @current_season
    
    @in_season_player_collection = @current_season.players
    @out_season_player_collection = Player.where.not(id: @in_season_player_collection.pluck(:id))

  end
  def show
    @player = Player.build(params[:id])
    add_breadcrumb "Home", home_path, :title => "Home"
    add_breadcrumb "Players", players_path, :title => "Players"
    add_breadcrumb "#{@player.name}", player_path(@player), :title => "Name"

  end
end
