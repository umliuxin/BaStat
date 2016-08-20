module Admin
  class GamesController < ApplicationController

    def show
      @game = Game.find(params[:id])
      @player_collection = @game.players

    end

    def create
      unless @game = Game.create(game_params)
        flash[:danger] = @game.errors.messages[0]
      end
      redirect_to admin_season_path(params[:game][:season_id])
    end

    def delete
      @game = Game.find(params[:id])
      @game.destroy

      redirect_to admin_season_path(@game.season_id)
    end

    private

    def game_params
      params.require(:game).permit(:opponent,:gametime,:season_id)
    end

  end
end
