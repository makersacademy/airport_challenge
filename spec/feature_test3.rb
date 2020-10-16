require_relative '../lib/plane.rb'
require_relative '../lib/airport.rb'
# feature test for the story number three

airport = Airport.new # capacity of Airport = 1 Plane
plane0 = Plane.new
airport.land(plane0)

# another plane to raise an error that the airport is full
plane1 = Plane.new

# expecting an error as the airport is full

airport.land(plane1)
