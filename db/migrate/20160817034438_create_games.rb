class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :opponent
      t.datetime :gametime, null: false
      t.belongs_to :season, index: true

      t.timestamps null: false
    end
  end
end
