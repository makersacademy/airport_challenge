require './docs/airport'
require './docs/plane'
# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
airport = Airport.new

airport.land #creates new Plane & adds to @planes

airport.take_off
