require './lib/airport'

airport = Airport.new
plane = Plane.new
p plane
airport.request_landing(plane)
p airport
airport.request_takeoff(plane)
p airport
p plane
