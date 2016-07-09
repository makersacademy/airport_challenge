require './lib/plane.rb'
require './lib/airport.rb'

# First User Story
plane = Plane.new
airport = Airport.new
airport.accept(plane)
puts plane.landed?
