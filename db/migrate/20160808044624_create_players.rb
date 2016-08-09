class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :number
      t.string :image_url
      t.text :bio
      t.integer :height
      t.integer :weight
      t.string :position

      t.timestamps null: false
    end
  end
end
