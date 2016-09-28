class Team

  include TeamConcern

  attr_reader :team_name, :team_logo

  def initialize
    @team_name = TEAM_NAME
    @team_logo = TEAM_LOGO_URL
    @wins = 0
    @loses = 0
  end

  def self.get
    @team = self.new
    @team.get_header_data
    @team
  end


  def get_header_data
    # Get data for team page header
    self.get_current_season
    self.games
    if @games.present?
      self.unrecorded_games
      self.scheduled_games
      self.record_games
      self.set_win_loss
      self.get_last_game
      self.get_next_game
      self.get_avg_stat
    end
  end

  def get_current_season
    @current_season ||=  Season.get_current_season
  end

  def games
    @games ||= @current_season.games if @current_season.present?
  end

  def scheduled_games
    # Consider how to structure this section
    scheduled_games ||= @games.select{|game| game.gametime > DateTime.now }
  end

  def unrecorded_games
    # Consider how to structure this section
    unrecord_games ||= @games.select{|game| game.gametime < DateTime.now && game.game_record == false}
  end

  def record_games
    # Consider how to structure this section
    record_games ||= @games.select{|game| game.gametime < DateTime.now && game.game_record == true}
    # record_games ||= @games.inner(:scores).select{|game| game.gametime < DateTime.now && game.game_record == true}
  end

  def get_last_game
    # Need Refactor
    record_games = self.record_games
    @last_game ||= record_games.sort_by{|g| g.gametime}.last
  end

  def get_next_game
    # Need Refactor
    scheduled_games = self.scheduled_games
    @next_game ||= scheduled_games.sort_by{|g| g.gametime}.first
  end


  def set_win_loss
    record_games = self.record_games
    record_games.each do |game|
      # Need refactor: Using joint table
      if game.win?
        @wins += 1
      else
        @loses += 1
      end
    end
  end

  def get_avg_stat
    # Will Refactor after stat tab is done
    record_games = self.record_games
    count = record_games.count
    teamsum = TeamStat.select("SUM(team_stats.fgm) AS fgm, SUM(team_stats.tpm) AS tpm, SUM(team_stats.ftm) AS ftm, SUM(team_stats.oreb) AS oreb, SUM(team_stats.dreb) AS dreb, SUM(team_stats.ast) AS ast").where(game_id: record_games.map(&:id)).first
    opposum = OppoTeamStat.select("SUM(oppo_team_stats.fgm) AS fgm, SUM(oppo_team_stats.tpm) AS tpm, SUM(oppo_team_stats.ftm) AS ftm").where(game_id: record_games.map(&:id)).first

    @avg_stat ={
      PPG: (teamsum.fgm * 2 + teamsum.tpm + teamsum.ftm).to_f/count.to_f,
      RPG: (teamsum.oreb + teamsum.dreb).to_f/count.to_f,
      APG: teamsum.ast.to_f/count.to_f,
      OPPG: (opposum.fgm * 2 + opposum.tpm + opposum.ftm).to_f/count
    }
  end

end
