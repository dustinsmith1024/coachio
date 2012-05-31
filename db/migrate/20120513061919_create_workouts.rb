class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.datetime :when
      t.boolean :group
      t.references :team

      t.timestamps
    end
    add_index :workouts, :team_id
  end
end
