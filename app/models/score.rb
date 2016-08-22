class Score < ActiveRecord::Base
  belongs_to :game
  validates :game_id, uniqueness: true

  def end_recording?
    if self.recording_quarter == GAME_END_INDEX
      return true
    else
      return false
    end
  end

  def update_quarter
    if self.recording_quarter < 5
      self.increment(:recording_quarter).save
    end
  end

  def update_score(params)
    if change_point = change_point(params[:action_index])
      self.increment(get_updated_quarter(params),by = change_point )
      self.increment(get_updated_team(params), by = change_point )
      self.save
    end
  end

  def change_point(index)
    case index
    when "0"
      2
    when "2"
      3
    when "4"
      1
    when "6"
      2
    else
      return false
    end
  end

  def get_updated_quarter(params)
    if params[:player_id] == "0"
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
    if params[:player_id] == "0"
      'point_op_total'.to_sym
    else
      'point_total'.to_sym
    end
  end
end
