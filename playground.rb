require_relative './lib/airport.rb'
require_relative './lib/plane.rb'
luton_airport = Airport.new
p luton_airport
p airbus747 = luton_airport.allows_for_take_off
airbus747.asking_for_permission
