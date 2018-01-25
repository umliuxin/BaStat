class CreateVideoTable < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :team_1
      t.string :team_2
      t.integer :game_day
      t.string :youtube_id
      t.datetime :gametime, null: false
      t.belongs_to :season, index: true

      t.timestamps null: false
    end
  end
end
