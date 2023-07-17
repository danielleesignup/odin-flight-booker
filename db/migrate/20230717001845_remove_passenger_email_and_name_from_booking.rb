class RemovePassengerEmailAndNameFromBooking < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :passenger_email, :string
    remove_column :bookings, :passenger_name, :string
  end
end
