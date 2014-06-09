class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :badges, :toDo, :completed

    def badges
        return [{:href => 'img/Infinity-Loop.png'},{:href => 'img/Compas.png'} ]
    end

    def toDo
         return []
    end

    def completed
		completed = []
		ActivityStatus.where({:user_id=>object.id, :status=>1}).each do |activity_status|
			completed.push(ActivitySerializer.new(activity_status.activity))
		end
		
		return completed
        #ActiveModel::ActivitySerializer.root = false
        #return [ActivitySerializer.new(Activity.first), ActivitySerializer.new(Activity.last)]
    end

end
