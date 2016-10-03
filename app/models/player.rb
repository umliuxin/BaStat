class Player < ActiveRecord::Base
  has_many :rosters
  has_many :seasons, through: :rosters
  has_many :actions
  has_many :player_stats
  

  validates :name, length: { minimum: 2, maximum: 55 }, presence: true, uniqueness: true
  validates :number, numericality: {only_integer: true}, presence: true, uniqueness: true
  validates :height, numericality: true
  validates :weight, numericality: true
  validates :bio, length: { maximum: 1000 }
  validates :position, inclusion: { in: %w(Center Forward Guard),
    message: "%{value} is not a valid position" }


end
