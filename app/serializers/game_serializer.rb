class GameSerializer < ApplicationSerializer
  attributes :gametime, :opponent, :game_record

  belongs_to :season
  has_one :team_stat
  has_one :oppo_team_stat
  has_one :score
  has_many :player_stats
  has_many :actions
end
