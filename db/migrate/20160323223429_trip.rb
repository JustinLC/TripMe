class Trip < ActiveRecord::Migration
	def change
  	create_table :trips do |t|
  		t.string :trip_name
  		t.string :destination
  		t.date :start_date
			t.date :end_date  		
  		t.timestamps null: false
	  end
  end
end
