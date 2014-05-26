class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity
  
    def self.hasVoted?(user_id, activity_id)
        @vote = Vote.where(:user_id => user_id, :activity_id => activity_id)[0]
        @vote.blank?
    end

    def self.voteOn(activity_id, user_id, rating)
        @activity = Activity.find(activity_id)
    	if Vote.hasVoted?(user_id, activity_id) == false
    		Vote.create(:activity_id => activity_id, :user_id => user_id, :score => rating)
        else
            @vote = Vote.where(:activity_id => activity_id, :user_id => user_id)[0] 
            @vote.score = rating
            @vote.save
            @activity.updateCount
    	end
        @activity.update
    end
end
