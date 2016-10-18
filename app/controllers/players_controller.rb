class PlayersController < ApplicationController
  def index
    @players = Player.all
  end
  def show
    @player = Player.build(params[:id])
  end
end
