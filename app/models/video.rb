require 'date'
class Video < ActiveRecord::Base

  belongs_to :season

  def self.fetchVideos(options={})
    query_obj = Video.all
    query_obj = query_obj.where("team_1 LIKE ? OR team_2 LIKE ?", "%#{options[:team]}%", "%#{options[:team]}%") unless options[:team].blank?
    query_obj = query_obj.where("season_id = ?", options[:season_id]) unless options[:season_id].blank?
    query_obj = query_obj.where("game_day = ?", options[:game_day]) unless options[:game_day].blank?
    query_obj = query_obj.limit(options[:limit]) unless options[:limit].blank?
    game_days = Video.all.uniq.pluck(:game_day)
    {
      :count => query_obj.count,
      :data => query_obj,
      :gamedays => game_days
    }
  end

  def self.fetchVideo(options={})
    {
      :data => Video.where("youtube_id = ?", options[:vid])
    }
  end

  def self.fetchRecommend(options={})
    {
      :data => {
        team_1_videos: Video.where("team_1 LIKE ? OR team_2 LIKE ?", "%#{options[:team_1]}%", "%#{options[:team_1]}%").limit(6),
        team_2_videos: Video.where("team_1 LIKE ? OR team_2 LIKE ?", "%#{options[:team_2]}%", "%#{options[:team_2]}%").limit(6),
        game_day_videos: Video.where("game_day = ?", options[:game_day]).limit(6),
        team_1_name: options[:team_1],
        team_2_name: options[:team_2],
        game_day_name: options[:game_day]
      },
      :gamedays => Video.all.uniq.pluck(:game_day)
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
