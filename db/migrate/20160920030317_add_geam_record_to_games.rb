class AddGeamRecordToGames < ActiveRecord::Migration
  def change
    add_column :games, :game_record, :boolean , default: false
  end
end
