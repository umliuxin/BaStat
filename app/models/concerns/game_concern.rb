module GameConcern

  def update_score(params)
    @score = Score.find_by(game_id: params[:game_id])
    @score.update_score(params)
  end

  def update_quarter(params)
    @score = Score.find_by(game_id: params[:game_id])
    @score.update_quarter
  end


end
