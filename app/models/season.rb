class Season < ActiveRecord::Base
  has_many :rosters
  has_many :players, through: :rosters
  has_many :games

  after_initialize {self.name = name.strip.downcase}
  validates :name, presence: true, uniqueness: true

  def set_default_season
    unless current_season = Season.find_by(is_current_season: true).blank?
      current_season.update(is_current_season: false)
    end
    unless self.update(is_current_season: true)
      flash[:danger] = self.errors.full_messages[0]
    end
  end


end