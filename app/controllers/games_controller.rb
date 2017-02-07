class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
    @playbyplayscore = Score.new
    add_breadcrumb "Home", home_path, :title => "Home"
    add_breadcrumb "Game Result", results_path, :title => "Game Result"
    add_breadcrumb "vs #{@game.opponent}", game_path(@game), :title => "Opponent"

  end

end
