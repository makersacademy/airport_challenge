require './lib/plane.rb'
require './lib/airport.rb'

# First User Story
plane = Plane.new
airport = Airport.new
airport.accept(plane)
puts "Plane landed: #{plane.landed?}"

# Second User Story
airport.take_off(plane)
puts "Plane in the air: #{!plane.landed?}"
