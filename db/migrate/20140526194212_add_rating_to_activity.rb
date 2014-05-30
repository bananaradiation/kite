class AddRatingToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :rating, :integer
  end
end
