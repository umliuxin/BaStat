class Season < ActiveRecord::Base
  has_many :rosters
  has_many :players, through: :rosters
  has_many :games
  
  after_initialize {self.name = name.strip.downcase}
  validates :name, presence: true, uniqueness: true


end
