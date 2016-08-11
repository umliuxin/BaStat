class SeasonController < ApplicationController
  def create
    @season = Season.new(season_params)
    ap @season
    unless @season.save
      flash[:danger] = @season.errors.messages
    end
    redirect_to(admin_index_path)

  end

  def update
  end

  def delete
  end

  private

  def season_params
    params.require(:season).permit(:name, :start_date)
  end
end
