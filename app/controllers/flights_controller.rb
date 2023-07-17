class FlightsController < ApplicationController
    def index
        @flights = Flight.all
        @departure_airports = Airport.all
        @arrival_airports = Airport.all
        @passenger_options = [1, 2, 3, 4]

        if params[:commit] == "Search"
            @searched_flights = @flights

            if params[:departure_id].present?
                @searched_flights = @searched_flights.where(departure_id: params[:departure_id])
            end
    
            if params[:arrival_id].present?
                @searched_flights = @searched_flights.where(arrival_id: params[:arrival_id])
            end

            if params[:flight].present? && (params[:flight][:year].present? || params[:flight][:month].present? || params[:flight][:day].present?)
                year = params[:flight][:year].presence || Date.today.year
                month = params[:flight][:month].presence || 1
                day = params[:flight][:day].presence || 1
                
                flight_date = Date.new(year.to_i, month.to_i, day.to_i)
                @searched_flights = @searched_flights.where("DATE(start_datetime) = ?", flight_date)
            end
              
    
            # if params[:flight][:year].present || params[:flight][:month].present || params[:flight][:day].present?
            #     flight_date = Date.new(params[:flight]["year"].to_i, params[:flight]["month"].to_i, params[:flight]["day"].to_i)
            #     @searched_flights = @searched_flights.where("DATE(start_datetime) = ?", flight_date)
            # end
            # @searched_flights = @flights.where(departure_id: params[:departure_id], arrival_id: params[:arrival_id])
            # if params[:flight].present?
            #     flight_date = Date.new(params[:flight]["year"].to_i, params[:flight]["month"].to_i, params[:flight]["day"].to_i)
            #     @searched_flights = @searched_flights.where("DATE(start_datetime) = ?", flight_date)
            # end
        end 

        if params[:commit] == 'Select Flight'
            # @selected_flight = @searched_flights.where(params[:selected_flight_id])
            redirect_to new_booking_path(selected_flight_id: params[:selected_flight_id])
        end
    end 
end
