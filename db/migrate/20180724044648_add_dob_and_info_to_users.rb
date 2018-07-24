class AddDobAndInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :DOB, :date
    add_column :users, :info, :text
  end
end
