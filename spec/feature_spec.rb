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
airport.land(plane2, weather)
airport.land(plane, weather)
puts "Landing #{plane2}"
puts "Landing #{plane}"

puts "Here are the planes at the airport: #{airport.planes}"

puts "Now #{plane2} is taking off ..."
airport.takeoff(plane2, weather)

puts "Here are the planes at the airport: #{airport.planes}"
puts airport.planes
puts

# these are my stormy feature tests
# weather.is_stormy
# airport.takeoff(plane, weather) # raises an error if airport.current_weather returns "weather.stormy == true'
# airport.land(plane, weather) # raises an error if airport.current_weather returns "weather.stormy == true'

29.times { airport.land(Plane.new, weather) }
puts "Here are the planes at the airport: #{airport.planes}"
puts airport.full?
# airport.land(Plane.new, weather) # should result in a run time error "Airport is full!""


puts "*" * 50
puts "Feature test end"
puts "*" * 50
