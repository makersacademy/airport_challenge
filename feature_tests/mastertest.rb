require './lib/airport.rb'
require './lib/plane.rb'

p plane1 = Plane.new
p plane2 = Plane.new
p plane3 = Plane.new
puts
airport1 = Airport.new
puts
p airport1.land(plane1)
p airport1.board(plane1)
p airport1.takeoff(plane1)
puts
p airport1.land(plane2)
p airport1.alight(plane2)
p airport1.takeoff(plane2)
puts
p airport1.land(plane3)
p airport1.board(plane3)
p airport1.takeoff(plane3)
puts
p plane1
p plane2
p plane3
