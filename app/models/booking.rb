class Booking < ApplicationRecord
    belongs_to :flight
    has_many :bookings_passengers, dependent: :destroy
    has_many :passengers, through: :bookings_passengers, class_name: 'Passenger'
    accepts_nested_attributes_for :passengers
end
