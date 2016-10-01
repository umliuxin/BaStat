class GameSerializer < ApplicationSerializer
  attributes :gametime, :opponent, :game_record, :test

  belongs_to :season
  has_one :team_stat
  has_one :score

  def test
    "#{object.gametime}"
  end
end
