class Game < ActiveRecord::Base
  belongs_to :season
  has_one :team_stat
  has_one :oppo_team_stat
  has_one :score
  has_many :actions
  has_many :player_stats
  has_many :players, through: :season

  validates :gametime, presence: true

  def self.schedule_game
    Game.where('gametime > ?', DateTime.now)
  end

  def self.untrack_game
    Game.where('gametime < ?', DateTime.now).where(game_record: false)
  end

  def self.result_game
    Game.where('gametime < ?', DateTime.now).where(game_record: true)
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

end
