class AddUserIdToLibrary < ActiveRecord::Migration[5.1]
  def change
    add_column :libraries, :user_id, :integer
  end
end
