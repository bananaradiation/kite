class ChangeActivityDescriptionToText < ActiveRecord::Migration
  def change
	change_column :activities, :description, :text
  end
end
