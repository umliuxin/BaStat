class Player < ActiveRecord::Base
  has_many :rosters
  has_many :seasons, through: :rosters
  has_many :actions
  has_many :player_stats


  validates :name, length: { minimum: 2, maximum: 55 }, presence: true, uniqueness: true
  validates :number, numericality: {only_integer: true}, presence: true, uniqueness: true
  validates :height, numericality: true
  validates :weight, numericality: true
  validates :bio, length: { maximum: 1000 }
  validates :position, inclusion: { in: %w(Center Forward Guard),
    message: "%{value} is not a valid position" }

  attr_accessor :current_season_avg_stat, :seasons_avg_stat

  def current_season
    @current_season ||= Season.get_current_season
  end

  def current_season_avg_stat

    sql = "SELECT AVG(fgm) AS fgm, AVG(fga) AS fga, AVG(tpa) AS tpa, AVG(tpm) AS tpm, AVG(fta) AS fta, AVG(ftm) AS ftm, AVG(oreb) AS oreb, AVG(dreb) AS dreb,
          AVG(ast) AS ast
FROM player_stats
LEFT JOIN games
ON player_stats.game_id=games.id
WHERE dnp='f' AND player_id="+ self.id.to_s+" AND games.game_record ='t' AND games.season_id="+Season.get_current_season.id.to_s
    @current_season_avg_stat ||= PlayerStat.find_by_sql(sql).first
  end

  def seasons_avg_stat
    sql = "SELECT AVG(fgm) AS fgm, AVG(fga) AS fga, AVG(tpa) AS tpa, AVG(tpm) AS tpm, AVG(fta) AS fta, AVG(ftm) AS ftm, AVG(oreb) AS oreb, AVG(dreb) AS dreb
          ,AVG(ast) AS ast, AVG(tov) AS tov, AVG(blk) AS blk, AVG(stl) AS stl,AVG(foul) AS foul, COUNT(*) AS game_id, season_id AS id
FROM player_stats
LEFT JOIN games
ON player_stats.game_id=games.id
WHERE dnp='f' AND player_id="+ self.id.to_s+" AND games.game_record ='t'
GROUP BY games.season_id
"
    @seasons_avg_stat ||= PlayerStat.find_by_sql(sql)
  end





end
