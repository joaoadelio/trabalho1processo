class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :bookingStartDate
      t.date :bnookigEndDate

      t.timestamps
    end
  end
end
