require './lib/plane'
require './lib/airport'

plane = Plane.new
port = Airport.new

plane.land
port.takeoff(plane)

p plane 