class AddDevolutionToLoan < ActiveRecord::Migration[5.1]
  def change
    add_column :loans, :devolution_id, :integer
  end
end
