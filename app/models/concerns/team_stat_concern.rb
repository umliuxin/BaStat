module TeamStatConcern
  def update_team_stat(params)
    @team_stat = TeamStat.find_by(game_id: params[:game_id])
    ap '_____________update team stat_______________'
    ap params[:action_index]
    case params[:action_index]
      when "0"
        ap "2PT Made"
        @team_stat.increment(:fgm).increment(:fga).save
      when "1"
        ap "2PT Miss"
        @team_stat.increment(:fga).save
      when "2"
        ap "3PT Made"
        @team_stat.increment(:fgm).increment(:fga).increment(:tpm).increment(:tpa).save
      when "3"
        ap "3PT Miss"
        @team_stat.increment(:fga).increment(:tpa).save
      when "4"
        ap "Free throw Made"
        @team_stat.increment(:fta).increment(:ftm).save
      when "5"
        ap "Free throw Miss"
        @team_stat.increment(:fta).save
      when "6"
        ap "Putback Made"
        @team_stat.increment(:oreb).increment(:fgm).increment(:fga).save
      when "7"
        ap "Putback Miss"
        @team_stat.increment(:oreb).increment(:fga).save
      when "8"
        ap "Assist"
        @team_stat.increment(:ast).save
      when "9"
        ap "Off Reb"
        @team_stat.increment(:oreb).save
      when "10"
        ap "Def Reb"
        @team_stat.increment(:dreb).save
      when "11"
        ap "Steal"
        @team_stat.increment(:stl).save
      when "12"
        ap "Foul"
        @team_stat.increment(:foul).save
      when "13"
        ap "Turnover"
        @team_stat.increment(:tov).save
      when "14"
        ap "Block"
        @team_stat.increment(:blk).save
      when "15"
        ap "QUATER_ENDS"

      else
        ap "Not Implement yet"
      end
  end
end
