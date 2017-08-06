require '../lib/airport.rb'

airport = Airport.new
plane = Plane.new

puts "plane status"
p "#{airport}"
p "#{plane}"

puts "plane landing"
p "#{airport.land(plane)}"
puts "#{airport.instance_variable_get(:@planes)}"

puts "plane take-off"
p "#{airport.take_off(plane)}"

puts "confirm that plane is no longer in the airport"
p "#{airport.instance_variable_get(:@planes)}"

puts "prevent take off when weather is stormy"
airport = Airport.new "stormy"
p "#{airport.take_off(plane)}"

puts "prevent landing when weather is stormy"
airport = Airport.new "stormy"
p "#{airport.land(plane)}"

puts "prevent landing when full"
airport = Airport.new
plane = Plane.new
airport.capacity.times do
  airport.land(plane)
end
