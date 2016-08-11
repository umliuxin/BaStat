class Team

  attr_accessor :team_name,:team_logo

  def initialize
    @team_name = TEAM_NAME
    @team_logo = TEAM_LOGO_URL
  end
end
