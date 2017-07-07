require './lib/airport'

airport = Airport.new
plane = Plane.new
airport.request_landing(plane)
plane.landing
p airport
airport.request_takeoff
plane.take_off
p airport
