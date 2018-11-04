require_relative 'plane'
require_relative 'airport'

p "creating 2 airports"
airport1 = Airport.new
airport2 = Airport.new

p "creating 2 airports"
plane1 = Plane.new
plane2 = Plane.new

p "land plane1 at airport1"
puts airport1.land(plane1)
p "land plane1 at airport1, shoule return error"
puts airport1.land(plane1)

p "plane 2 takes of from airport 2, should retrun error"
airport1.take_off(plane2)
p "plane 1 takes of from airport 1"
airport2.take_off(plane1)
