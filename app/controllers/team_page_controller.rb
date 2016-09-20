class TeamPageController < ApplicationController

  before_action :get_teampage_data, only: [:show]

  def show
  end

  def get_teampage_data
    @team = Team.new

  end


end
