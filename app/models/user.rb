# user {
# 	id,				//User ID
# 	name,			//User name
# 	badges[]		//Array of badge objects ***
# 	toDo[]			//Array of activity objects
# 	completed[]		//Array of activity objects
# }


class User < ActiveRecord::Base

	attr_accessible :email, :password, :name

	@@SAVE = 2
    @@COMPLETE = 1

    has_many :comments
    has_many :votes
    has_many :photos
    has_many :activity_statuses
    has_and_belongs_to_many :badges
    
    def completedActivity(activity_id)
    	@activity_status = self.activity_statuses.where(:activity_id => activity_id)[0]
    	return @activity_status.status == @@COMPLETE
    end

    def completed
    	self.activity_statuses.where(:status => @@COMPLETE)
    end

    def saved
		self.activity_statuses.where(:status => @@SAVE)
    end
end
