require './lib/airport'

#This file runs a feature test, emulating the commands run by the user in IRB
#Add a shebang to this?
#split into sections by what you are testing

puts
puts "initialize"
puts "builds an airport:"
puts airport = Airport.new

puts "creates a plane: "
puts plane = Plane.new

puts "weather is too stormy?"
puts weather = Weather.stormy?

puts
puts "landing the plane"

puts "checks if airport is full:"
puts airport.full?

puts "instructs plane to land at airport:"
puts airport.land(plane)

puts "checks planes landed at airport:"
puts airport.planes

puts "checks plane knows it has landed:"
puts plane.status

puts "checks plane knows the airport it is in:"
puts plane.airport

puts
puts "taking off from the airport"

puts "instructs plane to take off from airport"
puts airport.take_off(plane)

puts "checks planes landed at airport:"
puts airport.planes

puts "checks plane knows it has taken off:"
puts plane.status

puts "checks plane knows it is not in the airport:"
puts plane.airport

puts
puts "checking the weather"



puts

#puts "instructs plane to take off from airport"
#puts airport.take_off(plane)

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
