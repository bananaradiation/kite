# badge {
# 	id,				//Badge ID
# 	name,			//Badge name
# 	description,	//Badge description
# 	href			//Badge image link ***
# }

class Badge < ActiveRecord::Base
	attr_accessible :name
    has_and_belongs_to_many :users
	
	BADGES = {
		:welcome => 'WELCOME',
		:activity => 'ACTIVITY',
		:art => 'ART',
		:food => 'FOOD',
		:music => 'MUSIC',
		:sights => 'SIGHTS'
	}
	
	#Initializer
	def self.add_badges_to_db
		Badge::BADGES.each {|key, val| self.create({:name=>val})}
	end
end
