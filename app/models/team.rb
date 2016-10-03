class Team

  include TeamConcern

  attr_reader :team_name, :team_logo

  def initialize
    @team_name = TEAM_NAME
    @team_logo = TEAM_LOGO_URL
  end

  def self.get
    @team = self.new
  end
  
end
