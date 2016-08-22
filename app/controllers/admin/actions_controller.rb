module Admin
  class ActionsController < ApplicationController

    include GameConcern

    def create
      insert_position = cookies[:insert_position]
      return redirect_to admin_game_path(action_params[:game_id]) if game_ends?
      @action = Action.create(action_params)
      move_to_position(insert_position.to_i) unless insert_position.blank?
      update_team_stat(team_params) if @action.log_stat?
      update_player_stat(action_params) if @action.log_stat?
      update_score(action_params)
      redirect_to admin_game_path(action_params[:game_id])
    end

    def quarter_end
      @action = Action.create(quarter_params)
      update_quarter(quarter_params)
      redirect_to admin_game_path(quarter_params[:game_id])
    end




    private

    def action_params
      params.require(:move).permit(:player_id, :action_index, :game_id)
    end

    def team_params
      params.require(:move).permit(:action_index, :game_id)
    end

    def quarter_params
      {
        game_id: params[:game_id],
        player_id: 0,
        action_index: 15
      }
    end

    def game_ends?
      if params[:move][:quarter].to_i == GAME_END_INDEX
        flash[:danger] = 'Game ends already. Cannot create!'
        return true
      end
    end

    def move_to_position(position)
      @action.insert_at(position)
      cookies[:insert_position] = position + 1
    end

    def position_move
      @action = Action.find(params[:id])
      @action.move(params[:pos_index])
      redirect_to admin_game_path(@action.game_id)
    end

  end
end
