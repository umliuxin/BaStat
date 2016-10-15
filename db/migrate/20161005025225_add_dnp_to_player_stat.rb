class AddDnpToPlayerStat < ActiveRecord::Migration
  def change
    add_column :player_stats, :dnp, :boolean , default: false
  end
end
