require_relative './lib/airport.rb'
require_relative './lib/plane.rb'
luton_airport = Airport.new
p luton_airport
p airbus747 = Plane.new
p tupolev102 = Plane.new
luton_airport.allows_for_landing(airbus747)
luton_airport.allows_for_landing(tupolev102)
p luton_airport.hangar
luton_airport.allows_for_take_off(airbus747)
p luton_airport.hangar.include?(tupolev102)
