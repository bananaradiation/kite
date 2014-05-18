class Activity < ActiveRecord::Base
    has_many :comments
    has_many :votes
    has_many :photos
    has_many :users, through: :comments
    has_many :users, through: :votes 
    has_and_belongs_to_many :categories
    
    
    def getVoteScore
        self.votes.sum(:score)
    end
    
    
end
