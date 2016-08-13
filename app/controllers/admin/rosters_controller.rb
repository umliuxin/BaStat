module Admin
  class RostersController < ApplicationController
    def show
      @seasons = Season.all
      @current_season = @seasons.find_by(is_current_season:true)
    end

    def manage
      season_id = params[:id]
      @season = Season.find(season_id)
      @in_season_rosters = Roster.where(season: @season)
      @in_players = Player.where(id: @in_season_rosters.pluck(:player_id))
      @out_players = Player.where.not(id: @in_season_rosters.pluck(:player_id))
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
