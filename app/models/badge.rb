# badge {
# 	id,				//Badge ID
# 	name,			//Badge name
# 	description,	//Badge description
# 	href			//Badge image link ***
# }

class Badge < ActiveRecord::Base
    has_and_belongs_to_many :users
end
