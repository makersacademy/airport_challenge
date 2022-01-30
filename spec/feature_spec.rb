require './lib/plane'
require './lib/airport'
require './lib/weather'

def land_plane_at_airport(airport, plane)
  begin
    airport.land(plane)
  rescue => exception
    "Error Landing Plane at airport:  #{exception.message}"
  end
end

def takeoff_plane_from_airport(airport, plane)
  begin
    airport.take_off(plane)
  rescue => exception
    "Error Taking Off Plane at airport:  #{exception.message}"
  end
end

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

  
  p "Airport - land plane_one: #{land_plane_at_airport(airport,plane_one)}"
  p "Airport - take off plane_one: #{takeoff_plane_from_airport(airport,plane_one)}"
  
  p "Airport - land plane_two: #{land_plane_at_airport(airport,plane_two)}"
  p "Airport - take off plane_two: #{takeoff_plane_from_airport(airport,plane_two)}"
 
  rescue => exception
    puts "Error Message:  #{exception.message}"
end
