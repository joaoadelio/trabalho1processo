class AddUserIdToBookcase < ActiveRecord::Migration[5.1]
  def change
    add_column :bookcases, :user_id, :integer
  end
end
