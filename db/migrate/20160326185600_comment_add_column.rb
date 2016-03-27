class CommentAddColumn < ActiveRecord::Migration
  def change
  	add_column :comments, :parent_comment_id, :integer, default:0
  end
end
