class UsersTrips < ActiveRecord::Migration
  def change
  	create_table :trips_users, id: false do |t|
  		t.belongs_to :user, index: true 
  		t.belongs_to :trip, index: true 
  	end 
  end
end
