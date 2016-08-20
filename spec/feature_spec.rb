require 'airport'
require 'plane'
require 'weather'

puts "*" * 50
puts "Feature test start"
puts "*" * 50

puts "Creating some planes & airports"
airport = Airport.new
plane = Plane.new
plane2 = Plane.new
weather = Weather.new


puts "Landing some planes"
airport.land(plane2)
airport.land(plane)
puts "Landing #{plane2}"
puts "Landing #{plane}"

puts "Here are the planes at the airport: #{airport.planes}"

puts "Now #{plane2} is taking off ..."
airport.takeoff(plane2, weather)

puts "Here are the planes at the airport: #{airport.planes}"
puts airport.planes
puts

weather.is_stormy
# airport.takeoff(plane, weather) # raises an error if airport.current_weather returns "weather.stormy == true'

puts "*" * 50
puts "Feature test end"
puts "*" * 50
