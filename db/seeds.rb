Airport.delete_all
Flight.delete_all

# Create airports
airport_codes = ['SFO', 'NYC', 'LAX', 'ORD', 'DFW'] # Add more airport codes as needed

airport_codes.each do |code|
  Airport.create(code: code)
end

# Create flights
sfo = Airport.find_by(code: 'SFO')
nyc = Airport.find_by(code: 'NYC')
lax = Airport.find_by(code: 'LAX')
ord = Airport.find_by(code: 'ORD')
dfw = Airport.find_by(code: 'DFW')

Flight.create(number: 'FL001', departure_id: sfo.id, arrival_id: nyc.id, start_datetime: DateTime.now, duration: 120)
Flight.create(number: 'FL002', departure_id: lax.id, arrival_id: ord.id, start_datetime: DateTime.now + 1.day, duration: 180)

# Additional flights
Flight.create(number: 'FL003', departure_id: nyc.id, arrival_id: sfo.id, start_datetime: DateTime.now + 2.days, duration: 150)
Flight.create(number: 'FL004', departure_id: ord.id, arrival_id: lax.id, start_datetime: DateTime.now + 3.days, duration: 200)
Flight.create(number: 'FL005', departure_id: dfw.id, arrival_id: sfo.id, start_datetime: DateTime.now + 4.days, duration: 160)
Flight.create(number: 'FL006', departure_id: sfo.id, arrival_id: dfw.id, start_datetime: DateTime.now + 5.days, duration: 180)
