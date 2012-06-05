class Plan < ActiveRecord::Base
  belongs_to :activity
  belongs_to :workout
  default_scope :order => 'position ASC'
  attr_accessible :activity_id, :individual, :public, :workout_id, :position
  validates :activity_id,  :presence => true
  validates :workout_id,  :presence => true
  
  def minutes
    activity.minutes
  end
end
