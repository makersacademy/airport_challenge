require './lib/airport'

#This file runs a feature test, emulating the commands run by the user in IRB
#Add a shebang to this?
#split into sections by what you are testing 
puts "builds an airport:"
puts airport = Airport.new

#user won't need to see this - should be part of initializing the airport
puts "initiates a default capacity"
puts airport.capacity

puts "checks airport for landed planes"
puts airport.planes

puts "creates a plane:"
puts plane = Plane.new

puts "creates a plane:"
puts plane2 = Plane.new

puts "lands plane at airport"
puts airport.land(plane)

puts "lands plane at airport"
puts airport.land(plane2)

puts "checks airport for landed planes"
puts airport.planes

puts "checks if airport is full"
puts airport.full?

puts "status of the plane:"
puts plane.status

puts "plane can land"
puts plane.land

puts "plane can take off:"
puts plane.take_off
