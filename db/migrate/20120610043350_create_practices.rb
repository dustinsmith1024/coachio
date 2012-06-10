class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.date :scheduled_date
      t.time :scheduled_time
      t.references :team
      t.references :member
      t.boolean :track_results
      t.references :workout

      t.timestamps
    end
    add_index :practices, :team_id
    add_index :practices, :member_id
    add_index :practices, :workout_id
  end
end
