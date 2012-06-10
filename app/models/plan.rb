class Plan < ActiveRecord::Base
  belongs_to :activity
  belongs_to :workout
  has_many :practices
  default_scope :order => 'position ASC'
  attr_accessible :activity_id, :individual, :public, :workout_id, :position, :minutes , :reps
  validates :activity_id,  :presence => true
  #Not sure why but this fails the workout create, probably because its checking on build not save
  #validates :workout_id,  :presence => true
  
  def minutes
    activity.minutes
  end
end
