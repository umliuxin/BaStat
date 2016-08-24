class CreateTeamStats < ActiveRecord::Migration
  def change
    create_table :team_stats do |t|
      t.belongs_to :game, index: true
      t.integer :fgm, default: 0
      t.integer :fga, default: 0
      t.integer :tpm, default: 0
      t.integer :tpa, default: 0
      t.integer :ftm, default: 0
      t.integer :fta, default: 0
      t.integer :oreb, default: 0
      t.integer :dreb, default: 0
      t.integer :ast, default: 0
      t.integer :tov, default: 0
      t.integer :stl, default: 0
      t.integer :blk, default: 0
      t.integer :foul, default: 0

      t.timestamps null: false
    end
  end
end
