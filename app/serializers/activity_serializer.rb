class ActivitySerializer < ActiveModel::Serializer
    attributes :id, :name, :location, :description, :category, :photos, :num_votes, :avg_vote, :completed, :vote

    def category
        CategorySerializer.new(object.category)
    end

    def photos
		photos = Photo.where({:activity_id => object.id})
		
		data = []
		photos.each do |photo|
			data.push({
				:id => photo.id,
				:url => photo.url,
				:activity_id => photo.activity_id,
				:user_id => photo.user_id
			})
		end
		
		return data
    end
	
	def completed
		return nil if (object.viewer.nil?)
		
		as = ActivityStatus.where({:activity_id=>object.id, :user_id=>object.viewer.id, :status=>1})
		return !as.empty?
	end
	
	def vote
		return nil if (object.viewer.nil?)
		
		vote = Vote.where({:activity_id=>object.id, :user_id=>object.viewer.id}).first
		return nil if (vote.nil?)
		return vote.score
	end

    # def num_votes
    #     return 123
    # end

    # def avg_vote
    #     return 5
    # end
end
