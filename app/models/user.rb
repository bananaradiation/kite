class User < ActiveRecord::Base
    has_many :comments
    has_many :badges
    has_and_belongs_to_many :activities
end
