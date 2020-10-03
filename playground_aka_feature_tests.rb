require_relative './lib/airport.rb'
require_relative './lib/plane.rb'
luton_airport = Airport.new
p luton_airport
p airbus747 = Plane.new
p tupolev102 = Plane.new
luton_airport.landing(airbus747)
luton_airport.landing(tupolev102)
p luton_airport.hangar
luton_airport.take_off(airbus747)
p luton_airport.hangar.include?(tupolev102)
p luton_airport
p airbus747.asking_for_permission?
p luton_airport.giving_permition_for_landing(airbus747)
airbus747.landing_at(luton_airport)
p luton_airport
airbus747.taking_off_from(luton_airport)
p luton_airport.capacity
