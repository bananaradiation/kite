class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :description
      t.decimal :loc_x
      t.decimal :loc_y

      t.timestamps
    end
  end
end
