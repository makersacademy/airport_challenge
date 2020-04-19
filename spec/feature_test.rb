require './lib/airport'
require './lib/plane'
require './lib/weather'

airport1 = Airport.new(15)
airport2 = Airport.new(10)

plane1 = Plane.new
plane2 = Plane.new

puts "Plane1 is landing at Airport1"
airport1.land(plane1)
puts "Plane1 is taking off at Airport1"
airport1.take_off(plane1)
puts "Plane2 is landing at Airport2"
airport2.land(plane2)
puts "Plane1 is taking off at Airport1"
airport1.take_off(plane1)
