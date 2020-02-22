require "./lib/airport"
require "./lib/plane"

airport = Airport.new
plane = Plane.new
plane.take_off
airport.empty?
