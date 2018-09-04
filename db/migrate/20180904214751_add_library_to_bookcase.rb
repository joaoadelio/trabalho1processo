class AddLibraryToBookcase < ActiveRecord::Migration[5.1]
  def change
    add_column :bookcases, :library_id, :integer
  end
end
