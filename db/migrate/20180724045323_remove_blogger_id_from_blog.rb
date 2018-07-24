class RemoveBloggerIdFromBlog < ActiveRecord::Migration[5.2]
  def change
    remove_column :blogs, :blogger_id, :integer
  end
end
