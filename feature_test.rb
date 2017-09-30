require './lib/plane'
require './lib/airport'

airport = Airport.new
plane = Plane.new
plane.fly_to airport
p airport.parked_planes[-1] == plane
plane.take_off airport
p airport.parked_planes.include? plane
