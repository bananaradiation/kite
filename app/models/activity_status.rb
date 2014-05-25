class ActivityStatus < ActiveRecord::Base
  	self.primary_keys = :user, :activity
	belongs_to :user
end
