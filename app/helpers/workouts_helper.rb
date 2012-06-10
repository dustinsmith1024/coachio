module WorkoutsHelper
  def setup_workout(workout)
    # Add extra activities to the plan
    2.times { workout.plans.build() }
    puts workout
    workout
  end
end
