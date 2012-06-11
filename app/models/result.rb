class Result < ActiveRecord::Base
  belongs_to :practice
  belongs_to :activity
  attr_accessible :reps, :activity_id
  
  
  
  # Make methods for these then we can references them in the forms...
  def activity_name
    activity.name
  end
  
  def plan_reps
    practice.workout.plans.find_by_activity_id(activity.id).reps
  end
  
  
  def plan_position
    practice.workout.plans.find_by_activity_id(activity.id).position
  end
end
