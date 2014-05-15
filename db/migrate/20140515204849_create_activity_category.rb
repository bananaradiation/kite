class CreateActivityCategory < ActiveRecord::Migration
  def change
    create_table :activities_categories, id: false do |t|
        t.belongs_to :activity
        t.belongs_to :category
    end
  end
end
