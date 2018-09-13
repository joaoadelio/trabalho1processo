class AddBookToLoan < ActiveRecord::Migration[5.1]
  def change
    add_column :loans, :book_id, :integer
  end
end
