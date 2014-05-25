class CreateActivityStatuses < ActiveRecord::Migration
  def change
    create_table :activity_statuses do |t|
      t.references :user, index: true
      t.references :activity, index: true
      t.integer :status

      t.timestamps
    end
  end
end
