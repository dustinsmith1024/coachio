class Member < ActiveRecord::Base
  belongs_to :team
  has_many :practices
  attr_accessible :first_name, :last_name, :number, :player, :position
  validates :first_name,  :presence => true
  validates :last_name,  :presence => true
  
  def name
    first_name + ' ' + last_name
  end
  
  def practice_results
    results = practices.collect{|p| p.results}
    puts results
    if results
      results.flatten.sort!{|a,b| a.plan_id <=> b.plan_id }
    else
      results
    end
  end
end
