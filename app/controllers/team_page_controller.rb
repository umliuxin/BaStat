class TeamPageController < ApplicationController

  def show
    @team = Team.build
    ap '___________________'
    ap @team
    ap '___________________'
  end



end
