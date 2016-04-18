require_relative 'airport'
require_relative 'aircraft'
require_relative 'weather'

empty_airport = Airport.new
full_airport = Airport.new(50)
p full_airport
50.times { full_airport.dock << 'aircraft' }
p full_airport.dock.count
aircraft1 = Aircraft.new
aircraft2 = Aircraft.new
aircraft2.change_status

p storm = Weather.new(1)
p sunny = Weather.new(8)

p empty_airport.land aircraft2
