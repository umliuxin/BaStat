class AddScoreOnlyToPlayerstat < ActiveRecord::Migration
  def change
    add_column :player_stats, :score_only, :boolean , default: false
    add_column :player_stats, :score_only_score, :integer , default: 0
  end
end
