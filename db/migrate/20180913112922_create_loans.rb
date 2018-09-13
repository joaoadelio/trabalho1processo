class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans do |t|
      t.date :loanDate
      t.date :returnDate

      t.timestamps
    end
  end
end
