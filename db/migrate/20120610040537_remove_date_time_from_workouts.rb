class RemoveDateTimeFromWorkouts < ActiveRecord::Migration
  def change
    remove_column :workouts, :when, :datetime
  end
end
