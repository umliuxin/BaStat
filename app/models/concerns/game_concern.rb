module GameConcern
  def update_team_stat(params)
    @team_stat = TeamStat.find_by(game_id: params[:game_id])
    @team_stat.update_from_one_action(params)

  end

  def update_player_stat(params)
    @player_stat = PlayerStat.find_by({game_id: params[:game_id],player_id: params[:player_id]})
    @player_stat.update_from_one_action(params)
  end

  def update_score(params)
    @score = Score.find_by(game_id: params[:game_id])
    if GAME_ACTION_LIST[params[:action_index].to_i] == 'QUATER_ENDS'
      @score.update_quarter
    end
    @score.update_score(params)
  end

end
