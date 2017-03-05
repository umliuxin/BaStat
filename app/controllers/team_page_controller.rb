class TeamPageController < ApplicationController
  def show
    add_breadcrumb "Home", home_path, :title => "Home"
    @team = Team.build
    @seasons = Season.order(start_date: :desc)
  end

  def video
    
  end
end
