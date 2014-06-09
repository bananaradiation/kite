class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :badges, :completed

    def badges
		user_badges = UserBadge.where({:user_id=>object.id})
		badges = []
		user_badges.each do |user_badge|
			badges.push(user_badge.badge.name)
		end
		
		return badges
    end

    def completed
		completed = []
		ActivityStatus.where({:user_id=>object.id, :status=>1}).each do |activity_status|
			completed.push(ActivitySerializer.new(activity_status.activity))
		end
		
		return completed
    end
end
