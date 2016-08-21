module Admin
  class ActionsController < ApplicationController

    include GameConcern

    def create
      action = Action.create(action_params)
      unless action.player_id == 0
        update_team_stat(team_params)
        update_player_stat(action_params)
      end
      update_score(action_params)
      redirect_to admin_game_path(action_params[:game_id])
    end

    private

    def action_params
      params.require(:move).permit(:player_id, :action_index, :game_id)
    end

    def team_params
      params.require(:move).permit(:action_index, :game_id)
    end
  end
end
