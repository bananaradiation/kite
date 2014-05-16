class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :score
      t.references :user, index: true
      t.references :activity, index: true

      t.timestamps
    end
  end
end
