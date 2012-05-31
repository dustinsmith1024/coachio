class Member < ActiveRecord::Base
  belongs_to :team
  attr_accessible :first_name, :last_name, :number, :player, :position
  
  def name
    first_name + ' ' + last_name
  end
  
end
