class ActivitySerializer < ActiveModel::Serializer
    attributes :id, :name, :loc_x, :loc_y, :description, :category, :photos, :num_votes, :avg_vote

    def category
        CategorySerializer.new(object.categories.first)
    end

    def photos
        return ['http://lorempixel.com/300/200/nature/']
    end

    def num_votes
        return 123
    end

    def avg_vote
        return 5
    end
end
