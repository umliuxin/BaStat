class Game < ActiveRecord::Base
  belongs_to :season
  has_one :team_stat
  has_many :actions
  has_many :player_stats
  has_many :players, through: :season

  validates :gametime, presence: true

  def init_stat_obj
    init_player_stats
    init_team_stat
  end

  private

  def init_player_stats
    self.players.each do |player|
      self.player_stats.create({player:player})
    end

  end

  def init_team_stat
    unless team_stat = TeamStat.create(game: self)
      flash[:danger] = team_stat.errors.messages
    end
  end


end
