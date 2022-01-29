require './lib/plane'
require './lib/airport'
require './lib/weather'

begin
p "plan_one object instantiated: #{plane_one = Plane.new}"
p "plan_two object instantiated: #{plane_one = Plane.new}"
p "weather object instantiated: #{weather = Weather.new}"
p "weather is: #{weather.stormy?}"
p "weather is: #{weather.stormy?}"
p "weather is: #{weather.stormy?}"
p "weather is: #{weather.stormy?}"

p "airport *default capacity* object instantiated: #{airport = Airport.new (weather)}"

p "Airport - Land plane_one #{airport.land(plane_one)}"
p "Airport - Land plane_one #{airport.land(plane_one)}"
p "Airport - Takeoff plane_one: #{airport.take_off(plane_one)}"



rescue => exception
  puts "Error Message: " #{exception.message}"
end


