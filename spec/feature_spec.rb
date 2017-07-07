require './lib/airport'

airport = Airport.new
plane = Plane.new
airport.request_landing(plane)
plane.landing
p airport
plane.take_off
airport.request_takeoff
p airport
p plane
