class TeamPageController < ApplicationController

  def show
    @team = Team.build
    ap @team.current_season_avg_stat
  end



end
