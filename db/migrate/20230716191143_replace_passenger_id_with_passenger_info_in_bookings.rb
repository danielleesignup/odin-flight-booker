class ReplacePassengerIdWithPassengerInfoInBookings < ActiveRecord::Migration[7.0]
  def up
    remove_column :bookings, :passenger_id
    add_column :bookings, :passenger_email, :string
    add_column :bookings, :passenger_name, :string
  end

  def down
    add_column :bookings, :passenger_id, :integer
    remove_column :bookings, :passenger_email
    remove_column :bookings, :passenger_name
  end
end

