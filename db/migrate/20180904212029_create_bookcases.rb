class CreateBookcases < ActiveRecord::Migration[5.1]
  def change
    create_table :bookcases do |t|
      t.string :name

      t.timestamps
    end
  end
end
