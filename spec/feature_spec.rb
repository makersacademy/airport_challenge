require './lib/plane'
require './lib/airport'
require './lib/weather'

begin
  p "plane_one object instantiated: #{plane_one = Plane.new}"
  p "plane_two object instantiated: #{plane_two = Plane.new}"

  p "weather object instantiated: #{weather = Weather.new}"
  p "weather is: #{weather.stormy?}"
  p "weather is: #{weather.stormy?}"
  p "weather is: #{weather.stormy?}"
  p "weather is: #{weather.stormy?}"
  p "airport *default capacity* object instantiated: #{airport = Airport.new (weather)}"
  p "airport *capacity 10* object instantiated: #{airport_ten = Airport.new weather, 10}"
  
 
  p "Plane - Land plane_one #{plane_one.land}"
  p "Plane - Land plane_two #{plane_two.land}"

  p "Plane - Takeoff plane_one #{plane_one.take_off}"
  p "Plane - Takeoff plane_two #{plane_two.take_off}"

  p "Airport - land plane_one: #{airport.land(plane_one)}"
  p "Airport - land plane_two: #{airport.land(plane_two)}"

  rescue => exception
    puts "Error Message:  #{exception.message}"
end
