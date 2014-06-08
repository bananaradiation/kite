class ActivityStatus < ActiveRecord::Base
	attr_accessible :user_id, :activity_id, :status
	
	belongs_to :activity
	belongs_to :user
  	#self.primary_keys = :user, :activity
	#belongs_to :user
end
