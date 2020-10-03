require_relative './lib/airport.rb'
require_relative './lib/plane.rb'
luton_airport = Airport.new
p luton_airport
p airbus747 = Plane.new
p luton_airport.allows_for_landing(airbus747)
luton_airport.plane
p luton_airport.hangar
