# user {
# 	id,				//User ID
# 	name,			//User name
# 	badges[]		//Array of badge objects ***
# 	toDo[]			//Array of activity objects
# 	completed[]		//Array of activity objects
# }


class User < ActiveRecord::Base
    has_many :comments
    has_many :votes
    has_many :photos
    has_many :activity_statuses
    has_and_belongs_to_many :badges
    

end
