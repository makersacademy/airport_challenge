require '../lib/airport.rb'
require '../lib/plane.rb'

# USER STORY
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full

airport = Airport.new

(Airport::DEFAULT_CAPACITY).times {airport.land(Plane.new)} # fills airport up to default capacity with planes.
airport.confirm_land(Plane.new) # Trying to land a further plane will now return an error message saying the airport is full.
