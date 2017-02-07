class TeamPageController < ApplicationController
  def show
    add_breadcrumb "Home", home_path, :title => "Home"
    @team = Team.build
  end
end
