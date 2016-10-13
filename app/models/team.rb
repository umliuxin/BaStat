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
    @team.current_season
    @game_win = @team.game_win
    @game_lose = @team.game_lose
    @team
  end

  def current_season
    @current_season ||= Season.get_current_season
  end

  def game_win
    Score.joins(:game).where("point_total > point_op_total AND recording_quarter = 5 AND games.season_id = ?", @current_season.id).count
  end

  def game_lose
    Score.joins(:game).where("point_total < point_op_total AND recording_quarter = 5 AND games.season_id = ?", @current_season.id).count
  end




end
