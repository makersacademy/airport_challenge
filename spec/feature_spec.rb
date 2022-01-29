require './lib/plane'
require './lib/airport'
require './lib/weather'

begin
  p "plane_one object instantiated: #{plane_one = Plane.new}"
  p "plane_two object instantiated: #{plane_one = Plane.new}"
  p "weather object instantiated: #{weather = Weather.new}"
  p "weather is: #{weather.stormy?}"
  p "weather is: #{weather.stormy?}"
  p "weather is: #{weather.stormy?}"
  p "weather is: #{weather.stormy?}"
  p "airport *default capacity* object instantiated: #{airport = Airport.new (weather)}"

  p "Airport - Land plane_one #{airport.land(plane_one)}"
  p "Airport - Land plane_one #{airport.land(plane_one)}"
  p "Airport - Takeoff plane_one: #{airport.take_off(plane_one)}"

  p "plane_one take off: #{plane_one.take_off}"
  p "plane_one flying: #{plane_one.take_off}"

  p "plane_one land: #{plane_one.land}"
  p "plane_one flying: #{plane_one.land}"

  rescue => exception
    puts "Error Message: " # {exception.message}"
end
