class AddLanguageToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :language_id, :integer
  end
end
