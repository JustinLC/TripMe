class CommentColumn < ActiveRecord::Migration
  def change
  		create_table :comments do |t|
  		t.string :comment
  		t.string :url
  		t.timestamps null: false
  	end
  end
end
