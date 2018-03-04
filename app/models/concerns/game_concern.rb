module GameConcern

  def update_score(params)
    @score = Score.find_by(game_id: params[:game_id])
    @score.update_score(params)
  end

  def update_quarter(params)
    @score = Score.find_by(game_id: params[:game_id])
    @score.update_quarter
  end

  def get_max_stats(playerstats, item)
    max_stat ||= playerstats.first
    playerstats.each do |playerstat|
      if item == 'reb'
        if playerstat.rebound > max_stat.rebound
          max_stat = playerstat
        end
      elsif item == 'ast'
        if playerstat.ast > max_stat.ast
          max_stat = playerstat
        end
      elsif item == 'point'
        if playerstat.points > max_stat.points
          max_stat = playerstat
        end
      end
    end

    return max_stat
  end


end
