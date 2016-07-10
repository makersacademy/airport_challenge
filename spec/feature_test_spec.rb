require './lib/airport'

#This file runs a feature test, emulating the commands run by the user in IRB
#Add a shebang to this?
#split into sections by what you are testing

puts "initialize"
puts "builds an airport:"
puts airport = Airport.new

puts "creates a plane: "
puts plane = Plane.new

puts "landing a plane"

puts "checks if airport is full:"
puts airport.full?

puts "lands plane at airport:"
puts airport.land(plane)

puts "checks airport for landed planes:"
puts airport.planes

puts "checks plane knows it has landed:"
puts plane.status

puts "temp test landing a plane without airport" #not a call on status
puts plane.land(airport)

puts "checks plane knows where it is:"
puts plane.airport

puts "instructs plane to take off from airport"
puts airport.take_off(plane)

=begin
#user won't need to see this - should be part of initializing the airport
puts "initiates a default capacity"
puts airport.capacity

puts "checks airport for landed planes"
puts airport.planes


puts "creates a plane:"
puts plane2 = Plane.new

puts "lands plane at airport"
puts airport.land(plane2)

puts "plane can land"
puts plane.land

puts "plane can take off:"
puts plane.take_off
=end
