class RemoveColumnsFromTeamStat < ActiveRecord::Migration
  def change
    remove_column :team_stats, :q1_point
    remove_column :team_stats, :q2_point
    remove_column :team_stats, :q3_point
    remove_column :team_stats, :q4_point
  end
end
