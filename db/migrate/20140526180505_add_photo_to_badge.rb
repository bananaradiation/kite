class AddPhotoToBadge < ActiveRecord::Migration
  def change
    add_column :badges, :photo, :string
  end
end
