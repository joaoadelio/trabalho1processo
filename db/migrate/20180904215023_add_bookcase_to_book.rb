class AddBookcaseToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :bookcase_id, :integer
  end
end
