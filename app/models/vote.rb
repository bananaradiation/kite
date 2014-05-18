class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity
  
    def self.canVote?(user, activity)
        return Vote.where(:user_id => user, :activity_id => activity).empty?
    end
end
