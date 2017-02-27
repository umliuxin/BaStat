class GamelistController < ApplicationController

  include GameConcern

  def schedules
    @games = Game.schedule_game
    add_breadcrumb "Home", home_path, :title => "Home"
    add_breadcrumb "Game Schedule", schedules_path, :title => "Game Schedule"
  end

  def results
    @games = Game.result_game
    @seasons = Season.order(start_date: :desc)
    add_breadcrumb "Home", home_path, :title => "Home"
    add_breadcrumb "Game Result", results_path, :title => "Game Result"
  end
end
