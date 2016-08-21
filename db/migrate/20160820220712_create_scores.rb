class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.belongs_to :game, index: true
      t.integer :point_q1, default: 0
      t.integer :point_q2, default: 0
      t.integer :point_q3, default: 0
      t.integer :point_q4, default: 0
      t.integer :point_total, default: 0
      t.integer :point_op_q1, default: 0
      t.integer :point_op_q2, default: 0
      t.integer :point_op_q3, default: 0
      t.integer :point_op_q4, default: 0
      t.integer :point_op_total, default: 0
      t.integer :recording_quarter, default: 1
      t.timestamps null: false
    end
  end
end
