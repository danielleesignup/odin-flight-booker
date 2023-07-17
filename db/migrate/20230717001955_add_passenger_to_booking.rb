class AddPassengerToBooking < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :passenger, null: true, foreign_key: true
  end
end
