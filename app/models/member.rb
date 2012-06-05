class Member < ActiveRecord::Base
  belongs_to :team
  attr_accessible :first_name, :last_name, :number, :player, :position
  validates :first_name,  :presence => true
  validates :last_name,  :presence => true
  
  def name
    first_name + ' ' + last_name
  end
  
end
