class User < ActiveRecord::Base
    has_many :comments
    has_many :votes
    has_many :photos
    has_many :activities, through: :comments
    has_many :activities, through: :votes
    has_and_belongs_to_many :badges
    

end
