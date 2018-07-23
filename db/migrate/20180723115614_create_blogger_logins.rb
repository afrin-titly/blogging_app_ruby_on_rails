class CreateBloggerLogins < ActiveRecord::Migration[5.2]
  def change
    create_table :blogger_logins do |t|

      t.string :name
      t.text :email

      t.timestamps
    end
  end
end
