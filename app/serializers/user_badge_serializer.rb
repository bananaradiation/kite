class UserBadgeSerializer < ActiveModel::Serializer
    attributes :name
	
	def name
		return object.badge.name
	end
end
