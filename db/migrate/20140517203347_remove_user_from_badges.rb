class RemoveUserFromBadges < ActiveRecord::Migration
  def change
    remove_reference :badges, :user, index: true
  end
end
