class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.belongs_to :player, index: true
      t.belongs_to :season, index: true
      t.timestamps null: false
    end
  end
end
