class Game < ActiveRecord::Base
  belongs_to :season
  has_one :team_stat
  has_one :score
  has_many :actions
  has_many :player_stats
  has_many :players, through: :season

  validates :gametime, presence: true

  def init_stat_obj
    unless team_stat = TeamStat.create(game: self)
      flash[:danger] = team_stat.errors.messages
    end
  end

  def init_score_obj
    Score.create(game: self)
  end

  def migrate
    # Update team stat, oppo team stat, players_stat
    # Get all actions
    @action_collection = self.actions
    # New team stat obj
    @new_team_stat = TeamStat.new
    # New player stat obj
    @new_player_stats = {}
    self.players.each do |player|
      @new_player_stats[player.id] = PlayerStat.new()
    end
    #migrate data to new obj
    @action_collection.each do |action|
      @new_team_stat.update_from_one_action(action) unless [OPPO_TEAM_ID, NULL_PLAYER_ID].include? action.player_id
      @new_player_stats[action.player_id].update_from_one_action(action) unless [OPPO_TEAM_ID, NULL_PLAYER_ID, TEAM_ID].include? action.player_id
    end

    # Save obj to db
    team_flag = self.team_stat.update(@new_team_stat.attributes.except("id", "game_id", "created_at", "updated_at"))
    player_flag = true

    self.players.each do |player|
      player_flag &&= PlayerStat.find_or_create_by({game: self, player: player}).update(@new_player_stats[player.id].attributes.except("id", "game_id", "player_id","created_at", "updated_at"))
    end

    return team_flag && player_flag

  end




end
