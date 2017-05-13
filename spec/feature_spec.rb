require_relative '../lib/plane.rb'

# FEATURE TESTS
puts "Feature tests:"

puts "\nDefault values"

# Airport object is created and we inspect the default values.
puts "\nWe create and inspect the default values of an airport object."
airport_default = Airport.new
puts " #{airport_default} Identifier:"
puts airport_default.identifier
puts "#{airport_default} Capacity:"
puts "Airport default capacity is 50."
puts airport_default.capacity

# Plane object is created and we inspect the default values.
puts "\nWe create and inspect the default values of a plane object"
plane_default = Plane.new
puts "#{plane_default} Location"
puts plane_default.location

puts "Specific tests"

# Airport object default capacity can be overriden.
puts "\nAirport default capacity can be overriden. Given capacity is 35."
airport_capacity_overriden = Airport.new(35)
puts airport_capacity_overriden.capacity

# Plane object can land at an airport object
puts "\nPlane can land at an airport object"
airport_for_landing = Airport.new
plane_for_landing = Plane.new
puts plane_for_landing.location
plane_for_landing.lands_at(airport_for_landing)
puts plane_for_landing.location
