module Admin
  class SeasonsController < AdminController

    def index
      @seasons = Season.all.order('start_date')
    end

    def show
      @season = Season.find(params[:id])
      @games = @season.games.order('gametime')
    end

    def create
      unless @season = Season.create(season_params)
        flash[:danger] = @season.errors.messages
      end
      redirect_to(admin_seasons_path)
    end

    def set_current
      @season = Season.find(params[:id])
      @season.set_default_season

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
