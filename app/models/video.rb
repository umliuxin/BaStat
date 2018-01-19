class Video < ActiveRecord::Base

  belongs_to :season

  def self.fetchVideo(options={})

    query_obj = Video.all
    query_obj = query_obj.where("team_1 = ? OR team_2 =?", options[:team], options[:team]) unless options[:team].blank?
    query_obj = query_obj.where("season_id = ?", options[:season_id]) unless options[:season_id].blank?
    query_obj = query_obj.where("game_day = ?", options[:game_day]) unless options[:game_day].blank?

    {
      :count => query_obj.count,
      :data => query_obj,
      :gamedays => query_obj.uniq.pluck(:game_day)
    }
  end

end
