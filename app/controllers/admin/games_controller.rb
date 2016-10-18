module Admin
  class GamesController < ApplicationController
    layout 'admin'
    def show
      @game = Game.find(params[:id])
      @player_collection = @game.players
      @action_list = Action.where(game: @game).order('position')
      @score = Score.find_by(game: @game)
      
    end

    def dnp
      @game = Game.find(params[:id])
      @ingame = PlayerStat.where(game_id: params[:id], dnp: false)
      @outgame = PlayerStat.where(game_id: params[:id], dnp: true)
    end

    def dnp_add
      playerstat = PlayerStat.find_by(player_id: params[:player_id], game_id: params[:game_id])
      playerstat.update_dnp(true)
      redirect_to admin_game_dnp_path(playerstat.game_id)
    end

    def dnp_remove
      playerstat = PlayerStat.find_by(player_id: params[:player_id], game_id: params[:game_id])
      playerstat.update_dnp(false)
      redirect_to admin_game_dnp_path(playerstat.game_id)
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

    def migrate
      @game = Game.find(params[:id])
      if @game.migrate
        flash[:success] = 'Migration Done'
      else
        flash[:danger] = 'Migration Failed'
      end
      redirect_to admin_game_path(@game)
    end

    private

    def game_params
      params.require(:game).permit(:opponent,:gametime,:season_id)
    end

  end
end
