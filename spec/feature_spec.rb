require './lib/plane'
require './lib/airport'
require './lib/weather'

p "New plane object instantiated: #{plane = Plane.new}"
p "New airport object instantiated: #{airport = Airport.new}"
p "New weather object instantiated: #{weather = Weather.new}"

p "Airport - Takeoff: #{airport.take_off(plane)}"
p "Airport - Land a plane #{airport.land(plane)}"
