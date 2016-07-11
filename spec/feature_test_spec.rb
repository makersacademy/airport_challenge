require './lib/airport'

#This file runs a feature test, emulating commands run by the user in IRB
#Note the weather can change, so sometimes it will fail at different times!

puts
puts "initialize"
puts "builds an airport:"
puts airport = Airport.new

puts "creates a plane:"
puts plane = Plane.new

puts "weather is too stormy right now?"
puts Weather.stormy?


puts
puts "landing the plane"

puts "checks if airport is full:"
puts airport.full?

puts "instructs plane to land at airport:"
puts airport.land(plane)

puts "checks planes landed at airport:"
puts plane.airport

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
