class Team

  attr_accessor :team_name, :team_logo, :current_season, :games

  def initialize
    @team_name = TEAM_NAME
    @team_logo = TEAM_LOGO_URL
    bind_season_data
    bind_game_data
    # bind_player_data
  end

  def bind_season_data
    @current_season = Season.get_current_season
  end

  def bind_game_data
    # get all games in current_season
    @games = @current_season.games

    # get all games with final result

  end

end
