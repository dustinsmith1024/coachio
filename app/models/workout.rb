class Workout < ActiveRecord::Base
  belongs_to :team
  has_many :practices
  has_many :plans
  has_many :activities, :through => :plans
  accepts_nested_attributes_for :plans,
      :allow_destroy => true,
      :reject_if     => :all_blank
  attr_accessible :group, :name, :plans_attributes
  validates :name,  :presence => true
  
  def length
    plans.collect{|p| p.minutes}.sum
  end
end
