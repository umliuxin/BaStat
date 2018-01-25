class ChangeDateToVideos < ActiveRecord::Migration
  def change
    change_column :videos, :gametime , :date
  end
end
