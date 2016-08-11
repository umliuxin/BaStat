class Season < ActiveRecord::Base

  after_initialize {self.name = name.strip.downcase}
  validates :name, presence: true, uniqueness: true



end
