class AddBookToBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :book_id, :integer
  end
end
