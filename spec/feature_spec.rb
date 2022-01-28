require './lib/plane'
require './lib/airport'

p "New plane created: #{plane = Plane.new}"
p "New airport created: #{airport = Airport.new}"

p "Airport - Takeoff: #{airport.take_off(plane)}"
