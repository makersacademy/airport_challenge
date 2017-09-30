require './lib/plane'
require './lib/airport'

airport = Airport.new
plane = Plane.new
puts "Telling plane to fly to an airport"
plane.fly_to airport
puts "Checking plane is parked at airport:"
p airport.parked_planes[-1] == plane
"Telling plane to take off from airport"
plane.take_off airport
puts "Checking plane has left airport:"
p airport.parked_planes.include? plane
