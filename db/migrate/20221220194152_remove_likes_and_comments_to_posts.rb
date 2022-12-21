class RemoveLikesAndCommentsToPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :comments
    remove_column :posts, :likes
  end
end
