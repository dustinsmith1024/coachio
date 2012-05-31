class Activity < ActiveRecord::Base
  belongs_to :team
  has_many :plans
  has_many :workouts, :through => :plans
  attr_accessible :group, :minutes, :name
end
