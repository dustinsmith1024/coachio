class Result < ActiveRecord::Base
  belongs_to :practice
  belongs_to :plan
  attr_accessible :reps, :plan_id
  
  
  
  # Make methods for these then we can references them in the forms...
  def activity_name
    plan.activity.name
  end
  
  def plan_reps
    practice.workout.plans.find_by_activity_id(plan.activity.id).reps
  end
  
  
  def plan_position
    practice.workout.plans.find_by_activity_id(plan.activity.id).position
  end
end
