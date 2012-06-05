class Goal < ActiveRecord::Base
  belongs_to :team
  has_many :progresses
  attr_accessible :active, :description, :name, :team
  validates :name,  :presence => true
  
end
