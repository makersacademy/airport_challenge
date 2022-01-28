require './lib/plane'
require './lib/airport'
require './lib/weather'

p "New plane object instantiated: #{plane = Plane.new}"
p "New weather object instantiated: #{weather = Weather.new}"
p "New airport *default capacity* object instantiated: #{airport = Airport.new (weather)}"

p "Airport - Land a plane #{airport.land(plane)}"

begin
  p "Airport - Takeoff: #{airport.take_off(plane)}"
rescue => exception
  puts "Bad weather: #{exception}"
end


