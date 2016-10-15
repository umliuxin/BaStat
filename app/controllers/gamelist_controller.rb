class GamelistController < ApplicationController
  def schedules
    @games = Game.schedule_game
  end

  def results
    @games = Game.result_game
  end
end
