module Admin
  class ActionsController < ApplicationController

    include TeamStatConcern
    
    def create
      action = Action.create(action_params)
      update_team_stat(team_params)
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
