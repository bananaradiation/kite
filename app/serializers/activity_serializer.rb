class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :category
  
  def category
      CategorySerializer.new(object.categories.first)
  end
end
