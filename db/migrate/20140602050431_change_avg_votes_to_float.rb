class ChangeAvgVotesToFloat < ActiveRecord::Migration
  def change
	change_column :activities, :avg_vote, :float, :default=>0
  end
end
