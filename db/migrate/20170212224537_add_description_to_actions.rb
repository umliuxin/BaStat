class AddDescriptionToActions < ActiveRecord::Migration
  def change
    add_column :actions, :description, :text
    add_column :players, :birthday, :date
  end
end
