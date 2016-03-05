require_relative 'airport'
require_relative 'aircraft'
require_relative 'weather'

empty_airport = Airport.new
full_airport = Airport.new
5.times { full_airport.aircrafts << 'aircraft' }
aircraft1 = Aircraft.new
aircraft2 = Aircraft.new
aircraft2.change_status

p storm = Weather.new(15)
p sunny = Weather.new(85)

p empty_airport.land aircraft2, sunny
p empty_airport.takeoff aircraft2, storm
