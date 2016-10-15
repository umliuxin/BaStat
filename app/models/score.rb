class Score < ActiveRecord::Base
  belongs_to :game
  validates :game_id, uniqueness: true

  def update_score_with_action(action)
    if point = change_point({:action_index => action.action_index})
      self.increment(get_updated_team({:player_id => action.player_id}), by = point)
    end
  end

  def end_recording?
    if self.recording_quarter == GAME_END_INDEX
      return true
    else
      return false
    end
  end

  def update_quarter
    if self.recording_quarter == 4
      self.game.finish_recording
    end
    if self.recording_quarter < GAME_END_INDEX
      self.increment(:recording_quarter).save
    end
  end

  def update_score(params)
    if point = change_point(params)
      self.increment(get_updated_quarter(params), by = change_flag(params) * point )
      self.increment(get_updated_team(params), by = change_flag(params) * point )
      self.save
    end
  end


  def change_flag(params)
    if params[:remove].present? && params[:remove]
      -1
    else
      1
    end
  end

  def change_point(params)
    case params[:action_index].to_i
    when 0
      2
    when 2
      3
    when 4
      1
    when 6
      2
    else
      return false
    end
  end

  def get_updated_quarter(params)
    if params[:player_id].to_i == OPPO_TEAM_ID
      case self.recording_quarter
      when 1
        "point_op_q1".to_sym
      when 2
        "point_op_q2".to_sym
      when 3
        "point_op_q3".to_sym
      when 4
        "point_op_q4".to_sym
      else
        flash[:danger] = "Error: not found Quarter"
      end
    else
      case self.recording_quarter
      when 1
        "point_q1".to_sym
      when 2
        "point_q2".to_sym
      when 3
        "point_q3".to_sym
      when 4
        "point_q4".to_sym
      else
        flash[:danger] = "Error: not found Quarter"
      end
    end
  end #end def

  def get_updated_team(params)
    if params[:player_id].to_i == OPPO_TEAM_ID
      'point_op_total'.to_sym
    else
      'point_total'.to_sym
    end
  end


end
