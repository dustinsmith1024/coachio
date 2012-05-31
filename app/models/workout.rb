class Workout < ActiveRecord::Base
  belongs_to :team
  has_many :plans
  has_many :activities, :through => :plans
  accepts_nested_attributes_for :plans,
      :allow_destroy => true,
      :reject_if     => :all_blank
  attr_accessible :group, :name, :when, :plans_attributes
  
  def length
    plans.collect{|p| p.minutes}.sum
  end
end
