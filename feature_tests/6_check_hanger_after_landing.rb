require './lib/airport'
require './lib/plane'

puts "Airport initilaized"
puts  a1 = Airport.new
puts "Plane initilaized"
puts p1 = Plane.new
<<<<<<< HEAD
puts "set weather to sunny"
=======
puts "weather set to sunny"
>>>>>>> a678cb5e64440e17da1c6c117efb0ad616e575f6
srand(1)
puts "plane lands"
puts a1.land(p1)
puts "check if plane is in hanger"
puts a1.in_hanger?(p1)
