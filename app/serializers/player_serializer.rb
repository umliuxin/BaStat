class PlayerSerializer < ApplicationSerializer
  attributes :name, :number, :image_url, :bio, :height, :weight, :position

  has_many :rosters
  has_many :seasons
  has_many :player_stats
end
