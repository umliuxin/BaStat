module Admin
  class SeasonsController < ApplicationController

    def index
      @seasons = Season.all.order('start_date')
    end

    def show
      @season = Season.find(params[:id])
      @games = Game.where(season_id: @season.id).order('gametime')
    end

    def create
      @season = Season.new(season_params)
      unless @season.save
        flash[:danger] = @season.errors.messages
      end
      redirect_to(admin_seasons_path)

    end

    def set_current
      @current_season = Season.find_by(is_current_season: true)
      unless @current_season.blank?
        @current_season.update(is_current_season: false)
      end
      @season = Season.find(params[:id])
      unless @season.update(is_current_season: true)
        flash[:danger] = @season.errors.full_messages[0]
      end
      redirect_to(admin_seasons_path)
    end

    def delete
      @season = Season.find(params[:id])
      flash[:success] = @season.name + ' removed'
      @season.destroy
      redirect_to(admin_seasons_path)
    end

    def update
      @season = Season.find(params[:id])
      unless @season.update(season_params)
        flash[:danger] = @season.errors.full_messages[0]
      end
      redirect_to admin_season_path(@season)
    end



    private

    def season_params
      params.require(:season).permit(:name, :start_date)
    end
  end
end
