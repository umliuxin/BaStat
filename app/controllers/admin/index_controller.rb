module Admin

  class IndexController < ApplicationController
    def show
      @team = Team.new
    end
  end
end
