require './lib/airport.rb'

airport = Airport.new
plane = Plane.new

puts "plane status"
p "#{airport}"
p "#{plane}"

puts "plane landing"
p "#{airport.land(plane)}"
puts "#{airport}"
