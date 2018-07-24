class RemoveBlogIdFromBloggers < ActiveRecord::Migration[5.2]
  def change
    remove_column :bloggers, :blog_id, :integer
  end
end
