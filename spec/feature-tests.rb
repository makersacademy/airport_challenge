require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'
# airport = Airport.new
# puts airport.stormy?
# puts weather.stormy?
# plane = Plane.new

# airport.weather?
# airport.capacity?
# airport.update_capacity
# airport.land(plane)
# puts plane.status? == "land"
# airport.takeoff(plane)
# puts plane.status? == "air"
# puts plane.status?
# puts airport.weather? == "stormy" || airport.weather? == "sunny"
# airport.update_weather("stormy")
# airport.takeoff(plane)
# puts airport.weather?
# puts airport.takeoff(plane) == "takeoff not allowed"
# puts airport.land(plane) == "landing not allowed"
# airport.update_weather("sunny")
# airport.land(Plane.new)
# airport.land(Plane.new)
# puts airport.capacity? == 10
airport = Airport.new(2)
airport.update_weather("sunny")
plane = Plane.new
plane2 = Plane.new
puts plane.status?
puts plane2.status?
airport.takeoff(plane)
# airport.land(plane)
# airport.land(plane2)
# puts airport.get_planes?
# puts "---"
# # airport.takeoff(plane)
# airport.in_hangar(plane)
# puts airport.get_planes?
# puts @plances
# puts airport.capacity? == 2
# puts airport.capacity?
# 10.times { airport.land(Plane.new) }
# puts airport.full?
# airport.land(Plane.new)
# airport.land(Plane.new)
# puts airport.full?
