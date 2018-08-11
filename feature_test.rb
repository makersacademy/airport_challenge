require "./lib/airport.rb"
require "./lib/plane.rb"
airport = Airport.new
plane = Plane.new
plane.land(airport)

airport.hanger

plane.take_off(airport)

airport.hanger
