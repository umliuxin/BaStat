class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.belongs_to :game, index: true
      t.belongs_to :player, index:true
      t.integer :position
      t.integer :action_index, null: false

      t.timestamps null: false
    end
  end
end
