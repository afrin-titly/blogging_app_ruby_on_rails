class AddBloggerIdToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :blogger_id, :integer
  end
end
