require_relative "../lib/plane.rb"

# FEATURE TESTS
puts "Feature tests:"

puts "\n\nDEFAULT VALUES"

# Airport object is created and we inspect the default values.
puts "\nWe create and inspect the default values of an airport object."
airport_default = Airport.new
puts "Airport object has been created"
puts " #{airport_default} Identifier:"
puts airport_default.identifier
puts "#{airport_default} Capacity:"
puts "Airport default capacity is 50."
puts airport_default.capacity

# Plane object is created and we inspect the default values.
puts "\nWe create and inspect the default values of a plane object"
puts "Plane object has been created"
plane_default = Plane.new
puts "#{plane_default} Location"
puts plane_default.location

puts "\n\nSPECIFIC TESTS"

# Airport object default capacity can be overriden.
puts "\nAirport default capacity can be overriden. Given capacity is 35."
airport_capacity_overriden = Airport.new(nil, 35)
puts airport_capacity_overriden.capacity

# Plane object can land at an airport object
puts "\nPlane can land at an airport object"
airport_for_landing = Airport.new
plane_for_landing = Plane.new
puts plane_for_landing.location
plane_for_landing.lands_at(airport_for_landing)
puts "lands_at method has been called."
puts plane_for_landing.location

# Plane object object can takes off
puts "\nPlane can take off"
plane_for_take_off = Plane.new
puts "Plane location before takes off"
puts plane_for_take_off.location
plane_for_take_off.takes_off
puts "takes_off method has been called"
puts "Plane location after takes off"
puts plane_for_take_off.location
