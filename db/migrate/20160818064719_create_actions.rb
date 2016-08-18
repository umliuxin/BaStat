class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.belongs_to :game, index: true
      t.belongs_to :player, index:true
    
      t.timestamps null: false
    end
  end
end
