require_relative '../lib/plane.rb'

# FEATURE TESTS
puts "Feature tests:"

# Airport object is created and we inspect the default values.
puts "\nWe create and inspect the default values of an airport object."
airport_default = Airport.new
puts " #{airport_default} Identifier:"
puts airport_default.identifier
puts "#{airport_default} Capacity:"
puts airport_default.capacity

# Plane object is created and we inspect the default values.
puts "\nWe create and inspect the default values of a plane object"
plane_default = Plane.new
puts "#{plane_default} Location"
puts plane_default.location

# Airport object default capacity can be overriden.
puts "\nAirport default capacity can be overriden. Given capacity is 35."
airport_capacity_overriden = Airport.new(35)
puts airport_capacity_overriden.capacity

#
