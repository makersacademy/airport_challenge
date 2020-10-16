require_relative '../lib/plane.rb'
require_relative '../lib/airport.rb'
# feature test for the story number one
# new plane class instance
plane = Plane.new
# allowing plane to land
# having a plane landed on an airport
airport = Airport.new
# allowing plane to land
airport.land(plane)

puts airport.hangar
