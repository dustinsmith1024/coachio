class Practice < ActiveRecord::Base
  belongs_to :team
  belongs_to :member
  belongs_to :workout
  has_many :results
  accepts_nested_attributes_for :results,
      :allow_destroy => true,
      :reject_if     => :all_blank
  attr_accessible :scheduled_date, :scheduled_time, :track_results, :member_id, :complete, :notes, :results_attributes
  
  def results_totals
    # Get the totals of each activity totalled up
    puts 'hiii'
  end
  
end
