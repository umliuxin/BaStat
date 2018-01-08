class VideosController < ApplicationController
  before_action :get_current_season
  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end

  def create
    Video.create(video_params)
    redirect_to videos_path
  end

  def update
    @video = Video.find(params[:id])
    @video.update(video_params)
    redirect_to videos_path
  end

  def destroy
    Video.find(params[:id]).destroy
    redirect_to videos_path
  end

  private

  def video_params
    params.require(:video).permit(:team_1, :team_2, :game_day, :youtube_id, :gametime, :season_id)
  end
  def get_current_season
    @current_season = Season.get_current_season
  end
end
