class ChangeGamedayToVideos < ActiveRecord::Migration
  def change
    change_column :videos, :game_day , :string
  end
end
