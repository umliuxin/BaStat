module Admin

  class IndexController < AdminController
    def show
      @team = Team.new
    end
  end
end
