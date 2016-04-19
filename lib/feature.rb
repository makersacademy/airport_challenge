require './lib/airport'
require './lib/plane'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an
# airport and confirm that it has landed


airport = Airport.new
plane = Plane.new
airport.land(plane)
fail "Plane was not landed" unless plane.instance_variable_get(:@landed) == true


# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport
# and confirm that it is no longer in the airport

airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.take_off(plane)
fail "Plane did not take off" unless plane.instance_variable_get(:@landed) == false


# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.instance_variable_set(:@change_weather, 9)
airport.take_off(plane)
fail "Plane took off in stormy weather"
unless plane.instance_variable_get(:@landed) == false


# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy

airport = Airport.new
plane = Plane.new
airport.instance_variable_set(:@change_weather, 9)
airport.land(plane)
fail "Plane landed in stormy weather"
unless plane.instance_variable_get(:@landed) == true


# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full

airport = Airport.new
final_plane = Plane.new
Airport::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
# fail "Airport accepted more than it's capacity" unless airport.land(final_plane) == 'Airport full'


# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be
# overridden as appropriate

airport500 = Airport.new(500)
fail "Airport did not change it's capacity" unless airport500.instance_variable_get(:@capacity) == 500


# EDGE CASES
# Planes can only take off from airports they are in

airport1 = Airport.new
airport2 = Airport.new
plane = Plane.new
airport1.land(plane)
# airport2.take_off(plane)
# fail "Plane took off from an airport it wasn't in" unless plane.instance_variable_get(:@landed) == false


# planes that are landed cannot land again and must be in an airport

airport1 = Airport.new
airport2 = Airport.new
plane = Plane.new
airport1.land(plane)
# fail "Plane landed twice" unless airport2.land(plane) == 'Plane has already landed elsewhere'






