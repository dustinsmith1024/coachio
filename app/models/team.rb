class Team < ActiveRecord::Base
  attr_accessible :city, :mascot, :name, :state, :type
  validates :name,  :presence => true
  has_many :members
  has_many :activities
  has_many :workouts

  def plans
    workouts.collect{|w| w.plans }.flatten
  end

  def location
    city + ', ' + state
  end
  
  def team_name
    name + ' ' + mascot
  end
end
