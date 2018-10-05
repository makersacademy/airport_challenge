require './lib/airport.rb'
require './lib/plane.rb'
airport = Airport.new
plane = Plane.new
# airport.land(plane)
# airport.takeoff(plane)
airport.statuscheck(plane)
airport.prevent_takeoff(plane)
airport.weather?
airport.prevent_landing(plane)
airport.capacity?
airport.set_capacity
airport.land(plane)
puts plane.status? == "land"
airport.takeoff(plane)
puts plane.status? == "air"
puts plane.status?
puts airport.weather? == "stormy" || airport.weather? == "clear"
