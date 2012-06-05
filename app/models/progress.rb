class Progress < ActiveRecord::Base
  belongs_to :goal
  belongs_to :member
  attr_accessible :made, :total, :member_id
  validates :member_id,  :presence => true
  
end
