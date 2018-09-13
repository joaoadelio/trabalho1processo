class AddLoanToDevolution < ActiveRecord::Migration[5.1]
  def change
    add_column :devolutions, :loan_id, :integer
  end
end
