class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.belongs_to :player_id, index: true
      t.belongs_to :season_id, index: true
      t.timestamps null: false
    end
  end
end
