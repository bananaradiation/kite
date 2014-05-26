class AddAvgVoteAndNumVotesToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :avg_vote, :decimal
    add_column :activities, :num_votes, :integer
  end
end
