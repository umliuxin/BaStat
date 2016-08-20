class PlayerStat < ActiveRecord::Base
  belongs_to :game
  belongs_to :player

  validates :game, uniqueness: { scope: :player,
    message: "should only have one record per game per player" }
end
