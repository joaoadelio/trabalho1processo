class CreateDevolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :devolutions do |t|
      t.date :devolutionDate

      t.timestamps
    end
  end
end
