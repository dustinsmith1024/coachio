class RemoveDateTimeFromWorkouts < ActiveRecord::Migration
  def change
    remove_column :workouts, :when
  end
end
