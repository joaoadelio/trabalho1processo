class CreateJoinTableBookDiscipline < ActiveRecord::Migration[5.1]
  def change
    create_join_table :books, :disciplines do |t|
      # t.index [:book_id, :discipline_id]
      # t.index [:discipline_id, :book_id]
    end
  end
end
