class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :opponent
      t.datetime :gametime, null: false
      t.integer :season_id, null: false
      t.integer :score_id

      t.timestamps null: false
    end
  end
end
