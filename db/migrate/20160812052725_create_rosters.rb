class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.integer :player_id, null: false
      t.integer :season_id, null: false
      t.timestamps null: false
    end
  end
end
