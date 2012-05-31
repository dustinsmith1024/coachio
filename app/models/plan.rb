class Plan < ActiveRecord::Base
  belongs_to :activity
  belongs_to :workout
  default_scope :order => 'position ASC'
  attr_accessible :activity_id, :individual, :public, :workout_id, :position
  
  def minutes
    activity.minutes
  end
end
