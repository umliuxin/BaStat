class AddColumnsToAction < ActiveRecord::Migration
  def change
    add_column :actions, :position, :integer
    add_column :actions, :action_index, :integer, null: false, default: 0

  end
end
