require './lib/airport.rb'
require './lib/plane.rb'
airport = Airport.new
plane = Plane.new

# airport.weather?
# airport.capacity?
# airport.update_capacity
# airport.land(plane)
# puts plane.status? == "land"
# airport.takeoff(plane)
# puts plane.status? == "air"
# puts plane.status?
# puts airport.weather? == "stormy" || airport.weather? == "sunny"
airport.update_weather("stormy")
airport.takeoff(plane)
# puts airport.weather?
# puts airport.takeoff(plane) == "takeoff not allowed"
# puts airport.land(plane) == "landing not allowed"
# airport.update_weather("sunny")
# airport.land(Plane.new)
# airport.land(Plane.new)
# puts airport.capacity? == 10
# 10.times { airport.land(Plane.new) }
# puts airport.full?
# airport.land(Plane.new)
# airport.land(Plane.new)
# puts airport.full?
