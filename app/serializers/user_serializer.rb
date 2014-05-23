class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :badges, :toDo, :completed

    def badges
        return []
    end

    def toDo
        return []
    end

    def completed
        return []
    end

end
