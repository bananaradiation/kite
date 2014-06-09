class Vote < ActiveRecord::Base
	attr_accessible :user_id, :activity_id, :score

	belongs_to :user
	belongs_to :activity
  
    def self.hasVoted?(user_id, activity_id)
        @vote = Vote.where({:user_id => user_id, :activity_id => activity_id})
        return !@vote.empty?
    end

    def self.voteOn(activity_id, user_id, rating)
		activity = Activity.find_by_id(activity_id)
		cond = {:activity_id=>activity_id, :user_id=>user_id, :score=>rating}
		existing = Vote.where(cond).first
		
		if (!existing.nil?)
			existing.score = 0
			existing.save
		else
			vote = nil
			vote = Vote.create(cond) if (!Vote.hasVoted?(user_id, activity_id))
			
			vote ||= Vote.where({:activity_id => activity_id, :user_id => user_id}).first
			vote.score = rating
			vote.save
		end
	
=begin	
        activity = Activity.find_by_id(activity_id)
		vote = nil
		
		vote = Vote.create({
			:activity_id => activity_id, 
			:user_id => user_id, 
			:score => rating
		}) if (!Vote.hasVoted?(user_id, activity_id))
		
		vote ||= Vote.where({:activity_id => activity_id, :user_id => user_id}).first
		vote.score = rating
		vote.save
=end		
		activity.updateCount
		activity.update
    end
end
