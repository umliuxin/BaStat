require 'date'
class Video < ActiveRecord::Base

  belongs_to :season

  def self.fetchVideo(options={})

    query_obj = Video.all
    query_obj = query_obj.where("team_1 = ? OR team_2 =?", options[:team], options[:team]) unless options[:team].blank?
    query_obj = query_obj.where("season_id = ?", options[:season_id]) unless options[:season_id].blank?
    query_obj = query_obj.where("game_day = ?", options[:game_day]) unless options[:game_day].blank?
    query_obj = query_obj.limit(options[:limit]) unless options[:limit].blank?

    {
      :count => query_obj.count,
      :data => query_obj,
      :gamedays => query_obj.uniq.pluck(:game_day)
    }
  end

  def self.postVideos(videos = [])
    @current_season = Season.get_current_season
    videos.each do |video|
      video["season_id"] = @current_season.id
      video["gametime"] = Date.strptime(video["gametime"], '%Y%m%d')
      Video.create(video)
    end
  end

end
