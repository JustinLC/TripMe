class AddVotes < ActiveRecord::Migration
  def change
  	add_column :trips, :votes, :integer, default: 0
  end
end
