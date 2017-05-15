puts "FEATURE TEST"

require '../lib/airport.rb'

puts "Airports can be instantiated:"
puts airport = Airport.new
puts "Planes can be instantiated:"
puts plane = Plane.new

puts "Airports give a message when landing and launching planes:"
puts airport.lands_plane(plane)
puts airport.launches_plane(plane)

puts "Planes will not be landed if the weather is stormy:"
airport_stormy = Airport.new
airport_stormy.instance_variable_set(:@weather, "stormy")
puts airport_stormy.lands_plane(plane)
puts airport_stormy.launches_plane(plane)

puts "Planes cannot be launched if the airport is empty:"
airport_empty = Airport.new
airport_empty.instance_variable_set(:@planes, [])
puts airport_empty.launches_plane(plane)

puts "Planes cannot be landed if the airport is full:"
airport_full = Airport.new
airport_full.instance_variable_set(:@capacity, 0)
puts airport_full.lands_plane(plane)

puts "Airport capacity can be manually overidden:"
airport.override_capacity(50)
puts airport.capacity
