class Video < ActiveRecord::Base

  belongs_to :season

  def self.fetchVideo(options={})
    query_str = "(team_1 = ? OR team_2 = ?) AND season_id=? AND game_day=?"

    Video.where(query_str,
      options[:team] || "*",
      options[:team] || "*",
      options[:season_id] || "*",
      options[:game_day] || "*"
    )

    query_obj = Video.all
    query_obj = query_obj.where("team_1 = ? OR team_2 =?", options[:team], options[:team]) unless options[:team].blank?
    query_obj = query_obj.where("season_id = ?", options[:season_id]) unless options[:season_id].blank?
    query_obj = query_obj.where("game_day = ?", options[:game_day]) unless options[:game_day].blank?

    {
      :count => query_obj.count,
      :data => query_obj
    }
  end

end
