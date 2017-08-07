require './lib/plane.rb'
require './lib/airport.rb'

n = 20
m = 15
puts "number of planes to land #{n}"
i = 0
airport = Airport.new
puts "number of planes at airport currently #{airport.planes}"
while i < n
  plane = Plane.new
  plane.land(airport)
  i += 1
end
puts "number of planes after landings #{airport.planes}"

puts "number of planes to take off #{m}"
i = 0
while i < m
  plane = Plane.new(airport)
  plane.take_off(airport)
  i += 1
end
puts "number of planes after take offs #{airport.planes}"
