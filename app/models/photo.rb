class Photo < ActiveRecord::Base
	attr_accessible :user_id, :activity_id, :url
	
	belongs_to :activity
	belongs_to :user
end
