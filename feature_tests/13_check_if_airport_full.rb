require './lib/airport'
require './lib/weather'
require './lib/plane'

puts "Airport initilaized"
puts  a1 = Airport.new
puts "Check if airport full"
puts  a1.full?
puts "Weather set to sunny"
srand(1)
puts "Plane initialized"
puts p1 = Plane.new
puts "Plane lands"
puts a1.land(p1)
puts "Check if airport is full"
puts a1.full?
