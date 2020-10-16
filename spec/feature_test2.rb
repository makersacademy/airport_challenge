require_relative '../lib/plane.rb'
require_relative '../lib/airport.rb'
# feature test for the story number two
# new plane class instance
plane = Plane.new
# allowing plane to land
# having a plane landed on an airport
airport = Airport.new
# allowing plane to land
airport.land(plane)

# letting the specific plane take off
airport.take_off(plane)
