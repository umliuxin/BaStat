module Admin
  class GamesController < ApplicationController

    def show
      @game = Game.find(params[:id])
      @player_collection = @game.players
      @action_list = Action.where(game: @game).order('position')
      @score = Score.find_by(game: @game)
    end

    def create
      unless @game = Game.create(game_params)
        flash[:danger] = @game.errors.messages[0]
      end
      @game.init_stat_obj
      @game.init_score_obj
      redirect_to admin_season_path(@game.season)
    end

    def delete
      @game = Game.find(params[:id])
      @game.destroy

      redirect_to admin_season_path(@game.season)
    end

    def init
      @game = Game.find(params[:id])
      @game.init_stat_obj
      @game.init_score_obj
      redirect_to admin_game_path(@game)
    end

    private

    def game_params
      params.require(:game).permit(:opponent,:gametime,:season_id)
    end

  end
end
