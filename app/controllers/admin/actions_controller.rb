module Admin
  class ActionsController < ApplicationController

    include GameConcern

    def create
      # if insert_position exists, action will be added in that position
      # insert_position = cookies[:insert_position]
      insert_position = action_params[:position]

      # if game ends and position is not set, cannot add action in the list
      if game_ends? && insert_position.blank?
        flash[:danger] = "Game Ends, Need set position cookie to add new action"
        return redirect_to admin_game_path(action_params[:game_id])
      end
      # Create new action object
      @action = Action.create(action_params)
      if @action.valid?
        # if insert_position is set, move the new action object to insert_position
        if insert_position.blank?
          cookies.delete :insert_position
        else
          move_to_position(insert_position.to_i)
        end
        # Update score
        update_score(action_params)
      else
        flash[:danger] = 'Action is not valid'
      end

      redirect_to admin_game_path(action_params[:game_id])
    end

    def move
      action = Action.find(params[:id])
      action.move(params[:pos_index])
      redirect_to admin_game_path(action.game_id)
    end

    def quarter_end
      @action = Action.create(quarter_params)
      update_quarter(quarter_params)
      redirect_to admin_game_path(quarter_params[:game_id])
    end

    def delete
      @action = Action.find(params[:id])
      # Update score
      @action.update_score_before_removing
      # Remove from position
      @action.remove_from_list
      # Destory obj
      @action.destroy if @action.not_in_list?
      redirect_to admin_game_path(@action.game_id)
    end



    private

    def action_params
      params.require(:move).permit(:player_id, :action_index, :game_id, :position)
    end

    def team_params
      params.require(:move).permit(:action_index, :game_id)
    end

    def quarter_params
      {
        game_id: params[:game_id],
        player_id: NULL_PLAYER_ID,
        action_index: QUARTER_END_ACTION_INDEX
      }
    end

    def game_ends?
      if params[:move][:quarter].to_i == GAME_END_INDEX
        # flash[:danger] = 'Game ends already. Cannot create!'
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
