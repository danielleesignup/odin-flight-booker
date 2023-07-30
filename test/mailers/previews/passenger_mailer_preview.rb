# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview
    def booking_complete_email
        booking = Booking.last # Get the latest booking from the database or use any booking you want to preview
        PassengerMailer.booking_complete_email(booking)
    end
end
