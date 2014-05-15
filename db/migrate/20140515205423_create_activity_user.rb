class CreateActivityUser < ActiveRecord::Migration
  def change
    create_table :activities_users, id: false do |t|
        t.belongs_to :activity
        t.belongs_to :user
    end
  end
end
