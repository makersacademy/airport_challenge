require_relative '../lib/plane.rb'

require_relative '../lib/airport.rb'
# feature test for the story number 5
airport = Airport.new
plane = Plane.new

airport.land(plane)
