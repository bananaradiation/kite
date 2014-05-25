# activity {
# 	id,				//Activity ID
# 	name,			//Activity name
# 	description,	//Activity description
# 	location,		//Activity location string ***
# 	category,		//Category object
# 	photos[hrefs],	//Array of photo URLs
# 	num_votes,		//Total number of votes for this activity ***
# 	avg_vote,		//Average vote rating ***
# }


class Activity < ActiveRecord::Base
    has_many :comments
    has_many :votes
    has_many :photos
    belongs_to :category
    belongs_to :user
    
    
    def getRating
        self.votes.sum(:score)
    end
    
    def getVoteCount
        self.votes.count
    end

	def getAverage
		self.votes.average(:score)
	end    

    def getVoteOfUser(user)
        self.votes.where(:user => user)[0].score
    end
end
