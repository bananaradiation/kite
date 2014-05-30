class ChangeAvgVotesForUser < ActiveRecord::Migration
  def change
  	change_column :activities, :avg_vote, :decimal, :precision => 10, :scale => 10
  end
end
