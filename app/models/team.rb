class Team < ActiveRecord::Base
  attr_accessible :city, :mascot, :name, :state, :kind, :description
  validates :name,  :presence => true
  has_many :members
  has_many :activities
  has_many :workouts
  has_many :goals

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
