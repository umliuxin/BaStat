class Season < ActiveRecord::Base
  has_many :rosters
  after_initialize {self.name = name.strip.downcase}
  validates :name, presence: true, uniqueness: true


end
