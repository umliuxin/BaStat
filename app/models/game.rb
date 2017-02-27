class Game < ActiveRecord::Base

  include GameConcern

  belongs_to :season
  has_one :team_stat
  has_one :oppo_team_stat
  has_one :score
  has_many :actions
  has_many :player_stats
  has_many :players, through: :season

  validates :gametime, presence: true

  def self.schedule_game(season_id = nil)
    Game.order("gametime").where('gametime > ?', DateTime.now.beginning_of_day)
  end

  def self.untrack_game
    Game.where('gametime < ?', DateTime.now.beginning_of_day).where(game_record: false)
  end

  def self.result_game(season_id = nil)
    if season_id.blank?
      Game.order("gametime DESC").where('gametime <= ?', DateTime.now.end_of_day).where(game_record: true)
    else
      Game.order("gametime DESC").where('gametime <= ?', DateTime.now.end_of_day).where(game_record: true, season_id: season_id)
    end

  end

  def self.next_game
    Game.order("gametime").find_by('gametime > ? AND game_record = ?', DateTime.now.beginning_of_day ,false)
  end

  def self.last_game
    Game.order("gametime DESC").find_by('gametime < ? AND game_record = ?', DateTime.now.beginning_of_day, true)
  end

  def init_stat_obj
    TeamStat.create(game: self)
    OppoTeamStat.create(game: self)
  end

  def init_score_obj
    Score.create(game: self)
  end

  def win_or_lose
    #return W or L
    score ||= self.score
    return score.point_total > score.point_op_total ? 'W' : 'L'
  end

  def team
    Team.new
  end

  def find_player_stat_by_player(player)
    @player_stat ||= self.player_stats.find_by(player: player)
  end

  def get_stats_top_player
    # points, rebs, assits
    stats = self.player_stats.where(dnp: false)
    {
      point: get_max_stats(stats, 'point'),
      ast: get_max_stats(stats, 'ast'),
      reb: get_max_stats(stats, 'reb')
    }
  end

  def migrate
    # Update team stat, oppo team stat, players_stat
    # Get all actions
    @action_collection = self.actions
    # New team stat obj
    @new_team_stat = TeamStat.new
    @new_oppo_team_stat = OppoTeamStat.new
    # New player stat obj
    @new_player_stats = {}
    self.players.each do |player|
      @new_player_stats[player.id] = PlayerStat.new()
    end
    #migrate data to new obj
    @action_collection.each do |action|
      @new_team_stat.update_from_one_action(action) unless [OPPO_TEAM_ID, NULL_PLAYER_ID].include? action.player_id
      @new_oppo_team_stat.update_from_one_action(action) if action.player_id == OPPO_TEAM_ID
      @new_player_stats[action.player_id].update_from_one_action(action) unless [OPPO_TEAM_ID, NULL_PLAYER_ID, TEAM_ID].include? action.player_id

    end

    # Save obj to db
    team_flag = self.team_stat.update(@new_team_stat.attributes.except("id", "game_id", "created_at", "updated_at"))
    opp_team_flag = self.oppo_team_stat.update(@new_oppo_team_stat.attributes.except("id", "game_id", "created_at", "updated_at"))
    player_flag = true
    self.players.each do |player|
      player_flag &&= PlayerStat.find_or_create_by({game: self, player: player}).update(@new_player_stats[player.id].attributes.except("id", "game_id", "player_id","created_at", "updated_at"))
    end

    return team_flag && player_flag

  end

  def finish_recording
    self.update(game_record: true)
  end

  def opponent_name
    if self.opponent.to_i == 0
      self.opponent
    else
      OPPO_TEAM_ARR[self.opponent.to_i - 1][:name]
    end
  end

  def opponent_shortname
    unless self.opponent.to_i == 0
      OPPO_TEAM_ARR[self.opponent.to_i - 1][:shortname]
    else
      self.opponent[0..2].upcase
    end
  end

  def opponent_image
    unless self.opponent.to_i == 0
      image_name = OPPO_TEAM_ARR[self.opponent.to_i - 1][:logo]
      if image_name.length == 0
        TEAM_OPPO_LOGO_DEFAULT
      else
        'opponents/' + image_name
      end
    else
      TEAM_OPPO_LOGO_DEFAULT
    end
  end

  def opponent_image?
    return false if self.opponent.to_i == 0
    return OPPO_TEAM_ARR[self.opponent.to_i - 1][:logo].length != 0
  end

end
