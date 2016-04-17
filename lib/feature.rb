require './lib/airport'
require './lib/plane'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an
# airport and confirm that it has landed


airport = Airport.new
plane = Plane.new
airport.land(plane)
fail "Plane was not landed" unless plane.landed_status == true


# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport
# and confirm that it is no longer in the airport

airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.take_off(plane)
fail "Plane did not take off" unless plane.landed_status == false


# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.change_weather
airport.take_off(plane)
fail "Plane took off in stormy weather" unless plane.landed_status == false

# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy

# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full

airport = Airport.new
Airport::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
fail "Airport accepted more than it's capacity" unless airport.land(Plane.new) == 'Airport full'

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be
# overridden as appropriate

airport = Airport.new(500)
500.times { airport.land(Plane.new) }