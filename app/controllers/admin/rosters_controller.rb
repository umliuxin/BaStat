module Admin
  class RostersController < AdminController
    def show
      @seasons = Season.all
    end

    def manage
      @season = Season.find(params[:id])
      @in_season_player_collection = @season.players
      @out_season_player_collection = Player.where.not(id: @in_season_player_collection.pluck(:id))
      # @out_season_player_collection = Player.all - @in_season_player_collection
    end

    def add
      unless Roster.create(roster_params)
        flash[:danger] = 'OPERATION FAILED'
      end
      redirect_to admin_manage_roster_path(params[:season_id])
    end

    def delete
      roster = Roster.find_by(roster_params)
      roster.destroy
      redirect_to admin_manage_roster_path(params[:season_id])
    end

    private

    def roster_params
      {player_id: params[:player_id], season_id: params[:season_id]}
    end

  end
end
