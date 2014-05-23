class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :badges, :toDo, :completed

    def badges
        return [{:href => 'img/Infinity-Loop.png'},{:href => 'img/Compas.png'} ]
    end

    # def toDo
    #     return []
    # end

    def completed
        ActiveModel::ActivitySerializer.root = false
        return [ActivitySerializer.new(Activity.first), ActivitySerializer.new(Activity.last)]
    end

end
