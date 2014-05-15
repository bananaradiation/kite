class Activity < ActiveRecord::Base
    has_many :comments
    has_and_belongs_to_many :categories
    has_and_belongs_to_many :users
end
