# category {
# 	id,				//Category ID
# 	name			//Category name
# }

class Category < ActiveRecord::Base
    has_many :activities
end
