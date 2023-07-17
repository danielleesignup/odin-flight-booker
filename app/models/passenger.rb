class Passenger < ApplicationRecord
    # after_save :update_booking_passenger_id
    # belongs_to :booking
    has_many :bookings_passengers
    has_many :bookings, through: :bookings_passengers, class_name: 'Booking'
    # belongs_to :flight

    private

  def update_booking_passenger_id
    booking.update(passenger_id: id) if booking_id && !booking_id_changed?
  end
end
