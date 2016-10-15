module API
    class TeamController < ApplicationController

      def team
        @team = Team.get
        render :json => @team
      end
    end
end
