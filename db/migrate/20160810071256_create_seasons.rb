class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|

      t.string :name
      t.date :start_date
      t.date :end_date
      t.boolean :is_current_season, default: false

      t.timestamps null: false
    end
  end
end
