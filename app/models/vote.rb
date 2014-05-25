class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity
  
    def self.canVote?(user, activity)
        return Vote.where(:user_id => user, :activity_id => activity).empty?
    end

    def voteOn(activity, user, rating)
    	if Vote.canVote?(user, activity)
    		Vote.create(:activity => activity, :user => user, :score => rating)
    		return true
    	end
    	return false
    end
end
