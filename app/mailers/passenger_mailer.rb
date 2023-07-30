class PassengerMailer < ApplicationMailer
    default from: "danielleesignup@gmail.com"

    def booking_complete_email(booking)
        @booking = booking || Booking.last
        puts 'BOOKING ID!!!'
        puts @booking.id

        @url = 'http://example.com/booking-info'

        @booking.passengers.each do |passenger|
            @passenger = passenger
            puts "PASSENGER NAME !!!"
            puts passenger.name
            puts "PASSENGER INSPECT"
            puts passenger.inspect
            mail(to: passenger.email, subject: 'Your Booking is Complete!!')
        end
    end

end
