class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
    @playbyplayscore = Score.new

  end

end
