class RemoveIdColumnFromTables < ActiveRecord::Migration[5.2]

  def change
    remove_column :categories, :category_id, :integer
    remove_column :favorites, :favorite_id, :integer
    remove_column :post_comments, :post_comment_id, :integer
    remove_column :post_images, :post_image_id, :integer
    remove_column :posts, :post_id, :integer
    remove_column :users, :user_id, :integer
  end

end
