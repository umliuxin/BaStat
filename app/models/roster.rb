class Roster < ActiveRecord::Base
  belongs_to :player
  belongs_to :season
  validates :player_id, numericality: true, presence: true
  validates :season_id, numericality: true, presence: true
end
