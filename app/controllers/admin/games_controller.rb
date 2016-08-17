module Admin
  class GamesController < ApplicationController

    def show
      @game = Game.find(params[:id])
      @rosters = @game.season.rosters

    end

    def create
      @game = Game.new(game_params)
      unless @game.save
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
