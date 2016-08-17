class Game < ActiveRecord::Base
  belongs_to :season
  validates :gametime, presence: true
end
