class BookingsController < ApplicationController
    def new
        @selected_flight = Flight.find(params[:selected_flight_id])
        puts "@selected_flight: #{@selected_flight.inspect}" # Debugging statement

        @passenger_count = params[:passenger_count].to_i.presence || 1
        @booking = Booking.new
        @passenger_count.times { @booking.passengers.build}    
    end  

    def create
        # @selected_flight = Flight.find(params[:booking][:flight_id])
        @booking = Booking.new(booking_params)
        # @passenger_count = params[:passenger_count].to_i.presence || 1

        puts "params: #{params.inspect}" # Debugging statement
        puts "@selected_flight: #{@selected_flight.inspect}" # Debugging statement

          # @booking.passengers.each do |passenger|
          #   passenger.build_booking_passenger
          # end
        
        if @booking.save
          puts ""
          puts "@BOOKING.SAVE"
          puts @booking
          puts ""
          PassengerMailer.booking_complete_email(@booking).deliver_now
          redirect_to @booking, notice: 'Booking created successfully.'
        else
          render :new
        end
      end
    
      def show
        @booking = Booking.find(params[:id])
      end
    
      private
    
      def booking_params
        params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
      end

      # def booking_params
      #   params.require(:booking).permit!
      # end
end
