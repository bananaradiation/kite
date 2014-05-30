class ChangeDefaultsForActivity < ActiveRecord::Migration
  def change
  	change_column :activities, :avg_vote, :decimal, :precision => 10, :scale => 10, default: 0.0
  	change_column :activities, :num_votes, :integer, default: 0
  	change_column :activities, :rating, :integer, default: 0
  end
end
