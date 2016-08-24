module ApplicationHelper
  def action_from_index(index)
    if index == 15
      'QUATER ENDS'
    else
      GAME_ACTION_LIST[index]
    end
  end

  def recording_quater(index)
    if index == 5
      return GAME_END_TEXT
    end
    index
  end

end
