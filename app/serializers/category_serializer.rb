class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  
  def name
     object.description 
  end
  
end
