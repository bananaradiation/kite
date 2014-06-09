class UserBadge < ActiveRecord::Base
	attr_accessible :user_id, :badge_id
	belongs_to :user
	belongs_to :badge
	
	def self.award_badge(user_id, badge_sym)
		return if (user_id.nil?)
		badge = Badge.where({:name=>Badge::BADGES[badge_sym]}).first
		cond = {:user_id=>user_id, :badge_id=>badge.id}
		existing = self.where(cond)
		
		return if (!existing.empty?)
		
		return self.create(cond)
	end
	
	#Fake (for testing)
	def self.award_badge_fake(user_id, badge_sym)
		return if (user_id.nil?)
		
		badge = Badge.where({:name=>Badge::BADGES[badge_sym]}).first
		cond = {:user_id=>user_id, :badge_id=>badge.id}
		existing = self.where(cond)
		
		return if (!existing.empty?)
		
		return self.new(cond)
	end
end
