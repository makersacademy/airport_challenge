# require_relative "../lib/plane.rb"
#
# # FEATURE TESTS
# puts "Feature tests:"
# puts "============="
#
# puts "\n\nDEFAULT VALUES"
# puts "============="
#
# # Airport object is created and we inspect the default values.
# puts "\nWe create and inspect the default values of an airport object."
# airport_default = Airport.new
# puts "Airport object has been created"
# puts "#{airport_default}"
# puts "Identifier: #{airport_default.identifier}"
# puts "Airport default capacity is 50."
# puts "Capacity: #{airport_default.capacity}"
#
# # Plane object is created and we inspect the default values.
# puts "\nWe create and inspect the default values of a plane object"
# puts "Plane object has been created"
# plane_default = Plane.new
# puts "#{plane_default} Location"
# puts plane_default.location
#
# puts "\n\nSPECIFIC TESTS"
# puts "============="
#
# puts "\nAirport Class"
# puts "============="
#
# # Airport object default capacity can be overriden.
# puts "\nAirport default capacity can be overriden. Given capacity is 35."
# airport_capacity_overriden = Airport.new("NIL", 35)
# puts airport_capacity_overriden.capacity
#
# puts "\nPlane Class"
# puts "============="
#
# # Plane object object can takes off
# puts "\nPlane can take off"
# plane_for_take_off = Plane.new
# puts "Plane location before takes off"
# puts plane_for_take_off.location
# plane_for_take_off.departure
# puts "departure method has been called"
# puts "Plane location after takes off"
# puts plane_for_take_off.location
#
# # Plane object can land at an airport object
# puts "\nPlane can land at an airport object"
# airport_for_arriving = Airport.new
# plane_for_arriving = Plane.new
# puts plane_for_arriving.location
# plane_for_arriving.departure
# plane_for_arriving.land_at(airport_for_arriving)
# puts "arrives_at method has been called."
# puts plane_for_arriving.location
