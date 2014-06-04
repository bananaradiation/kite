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

    def self.getActivity(activity)
        @activity = Activity.find(activity)
    end
    
    def self.getActivitiesBy2(category, user)
        if category != nil and user != nil
            Activity.where(:category_id => category, :user_id => user)
        else
            Activity.all
        end

    end 

    def self.getActivitiesBy1(category)
        if category != nil
            Activity.where(:category_id => category)
        else
            Activity.all
        end

    end 

    def getRating
        self.votes.sum(:score)
    end
    
    def getVoteCount
        self.votes.count
    end


    def getVoteOfUser(user)
        self.votes.where(:user => user)[0].score
    end

    def update
        self.avg_vote = self.votes.average(:score).to_f
        self.rating = self.getRating
        self.save
    end

    def updateCount
        self.num_votes = self.getVoteCount
        self.save
    end
	
	def add_photo(uid, url)
		return Photo.create({
			:activity_id => self.id,
			:url => url,
			:user_id => uid
		})
	end

end
