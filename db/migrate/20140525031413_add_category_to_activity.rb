class AddCategoryToActivity < ActiveRecord::Migration
  def change
    add_reference :activities, :category, index: true
  end
end
