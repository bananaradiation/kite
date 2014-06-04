class ActivitySerializer < ActiveModel::Serializer
    attributes :id, :name, :location, :description, :category, :photos, :num_votes, :avg_vote

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

    # def num_votes
    #     return 123
    # end

    # def avg_vote
    #     return 5
    # end
end
