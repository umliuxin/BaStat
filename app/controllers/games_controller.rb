class GamesController < ApplicationController
  def results
    @games = Game.result_game
  end

  def show
  end

  def schedules
    @games = Game.schedule_game
  end
end
