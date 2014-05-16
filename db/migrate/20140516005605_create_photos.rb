class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.references :activity, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
