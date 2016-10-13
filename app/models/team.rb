class Team

  include TeamConcern

  attr_reader :team_name, :team_logo
  attr_accessor :last_game, :next_game, :team_stat_avg, :game_win, :game_lose, :current_season

  def initialize
    @team_name = TEAM_NAME
    @team_logo = TEAM_LOGO_URL
  end

  def self.build
    @team = Team.new
    @team.current_season = @team.current_season
    @team.game_win = @team.game_win
    @team.game_lose = @team.game_lose
    @team.next_game = @team.next_game
    @team.last_game = @team.last_game
    ap @team.current_season_avg_stat
    @team
  end

  def current_season
    Season.get_current_season
  end

  def game_win
    Score.joins(:game).where("point_total > point_op_total AND recording_quarter = 5 AND games.season_id = ?", self.current_season.id).count
  end

  def game_lose
    Score.joins(:game).where("point_total < point_op_total AND recording_quarter = 5 AND games.season_id = ?", self.current_season.id).count
  end

  def next_game
    Game.order("gametime").find_by('gametime > ? AND game_record = ?', DateTime.now ,false)
  end

  def last_game
    Game.order("gametime DESC").find_by('gametime < ? AND game_record = ?', DateTime.now, true)
  end

  def current_season_avg_stat

    sql = "SELECT AVG(fgm) AS fgm, AVG(fga) AS fga, AVG(tpa) AS tpa, AVG(tpm) AS tpm, AVG(fta) AS fta, AVG(ftm) AS ftm, AVG(oreb) AS oreb, AVG(dreb) AS dreb, AVG(ast) AS ast
FROM team_stats
LEFT JOIN games
ON team_stats.game_id=games.id
WHERE games.game_record ='t' AND games.season_id="+self.current_season.id.to_s
    TeamStat.find_by_sql(sql).first
  end


end
