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
  # validate :birthday, :birthday_cannot_be_in_the_past

  attr_accessor :avg_stat_current_season, :avg_stat_seasons, :games_current_season, :player_image_url

  def self.build(id)
    player = Player.find(id)
    player.avg_stat_current_season = player.current_season_avg_stat
    player.avg_stat_seasons = player.seasons_avg_stat
    player.games_current_season = player.current_season_games
    player
  end

  def current_season
    @current_season ||= Season.get_current_season
  end

  def current_season_avg_stat

    sql = "SELECT AVG(fgm) AS fgm, AVG(fga) AS fga, AVG(tpa) AS tpa, AVG(tpm) AS tpm, AVG(fta) AS fta, AVG(ftm) AS ftm, AVG(oreb) AS oreb, AVG(dreb) AS dreb,
          AVG(ast) AS ast
FROM player_stats
LEFT JOIN games
ON player_stats.game_id=games.id
WHERE dnp='f' AND player_id="+ self.id.to_s+" AND dnp='f' AND games.game_record ='t' AND games.season_id="+Season.get_current_season.id.to_s
    PlayerStat.find_by_sql(sql).first
  end

  def seasons_avg_stat
    sql = "SELECT AVG(fgm) AS fgm, AVG(fga) AS fga, AVG(tpa) AS tpa, AVG(tpm) AS tpm, AVG(fta) AS fta, AVG(ftm) AS ftm, AVG(oreb) AS oreb, AVG(dreb) AS dreb
          ,AVG(ast) AS ast, AVG(tov) AS tov, AVG(blk) AS blk, AVG(stl) AS stl,AVG(foul) AS foul, COUNT(*) AS game_id, season_id AS id
FROM player_stats
LEFT JOIN games
ON player_stats.game_id=games.id
WHERE dnp='f' AND player_id="+ self.id.to_s+" AND games.game_record ='t' AND dnp='f'
GROUP BY games.season_id
ORDER BY season_id DESC
"
    PlayerStat.find_by_sql(sql)
  end

  def current_season_games
    self.current_season.recorded_games
  end

  # def birthday_cannot_be_in_the_past
  #  if :birthday < Date.today
  #    errors.add(:birthday, "can't be in the past")
  #  end
  # end

  def player_image_url
    return PLAYER_DEFAULT_IMAGE if self.image_url.blank?
    'players/' + self.image_url
  end



end
