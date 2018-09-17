class RemoveLoanIdFromDevolution < ActiveRecord::Migration[5.1]
  def change
    remove_column :devolutions, :loan_id, :integer
  end
end
