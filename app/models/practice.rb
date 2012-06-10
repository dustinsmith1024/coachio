class Practice < ActiveRecord::Base
  belongs_to :team
  belongs_to :member
  belongs_to :workout
  attr_accessible :scheduled_date, :scheduled_time, :track_results, :member_id
end
