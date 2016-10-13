class ChangeColFloatToTeamStat < ActiveRecord::Migration
  def change
      change_column :team_stats, :fgm , :float, default: 0
      change_column :team_stats, :fga , :float, default: 0
      change_column :team_stats, :tpm , :float, default: 0
      change_column :team_stats, :tpa , :float, default: 0
      change_column :team_stats, :ftm , :float, default: 0
      change_column :team_stats, :fta , :float, default: 0
      change_column :team_stats, :oreb , :float, default: 0
      change_column :team_stats, :dreb , :float, default: 0
      change_column :team_stats, :ast , :float, default: 0
      change_column :team_stats, :tov , :float, default: 0
      change_column :team_stats, :stl , :float, default: 0
      change_column :team_stats, :blk , :float, default: 0
      change_column :team_stats, :foul , :float, default: 0

      change_column :player_stats, :fgm , :float, default: 0
      change_column :player_stats, :fga , :float, default: 0
      change_column :player_stats, :tpm , :float, default: 0
      change_column :player_stats, :tpa , :float, default: 0
      change_column :player_stats, :ftm , :float, default: 0
      change_column :player_stats, :fta , :float, default: 0
      change_column :player_stats, :oreb , :float, default: 0
      change_column :player_stats, :dreb , :float, default: 0
      change_column :player_stats, :ast , :float, default: 0
      change_column :player_stats, :tov , :float, default: 0
      change_column :player_stats, :stl , :float, default: 0
      change_column :player_stats, :blk , :float, default: 0
      change_column :player_stats, :foul , :float, default: 0
    end
end
