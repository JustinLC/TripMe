class TripColumns < ActiveRecord::Migration
  def change
  	create_table :trips do |t|
  		t.string :tripname
  		t.string :destination
  		t.date :enddate
  		t.date :startdate
  	end 
  end
end
