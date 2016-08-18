class Game < ActiveRecord::Base
  belongs_to :season
  has_one :team_stat
  has_many :actions
  has_many :player_stats
  has_many :players, through: :season

  validates :gametime, presence: true
end
