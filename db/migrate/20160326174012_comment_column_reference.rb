class CommentColumnReference < ActiveRecord::Migration
  def change
  	add_reference :comments, :user, foreign_key: true
  	add_reference :comments, :trip, foreign_key: true
  end
end
