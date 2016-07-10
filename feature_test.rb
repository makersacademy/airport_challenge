require './lib/plane.rb'
require './lib/airport.rb'
require './lib/weather.rb'

# # First User Story
# plane = Plane.new
# airport = Airport.new
# airport.land(plane)
# puts "Plane landed: #{plane.landed?}"
#
# # Second User Story
# airport.take_off(plane)
# puts "Plane in the air: #{!plane.landed?}"

# # Third User Story
# # I want to prevent takeoff when weather is stormy
# airport.land(plane)
# airport.weather.set_stormy
# airport.take_off(plane)

# # Fourth User Story
# # I want to prevent landing when weather is stormy
# airport = Airport.new
# plane = Plane.new
# airport.weather.set_stormy
# airport.land(plane)

# # Fifth User Story
# # I want to prevent landing when the airport is full
# airport = Airport.new
# airport.weather.set_sunny
# 20.times { airport.land(Plane.new) }
# airport.land(Plane.new)

# # Sixth User Story
# # I'd like a default airport capacity that can be overridden as appropriate
# airport = Airport.new(40)
# 40.times { airport.land(Plane.new) }
# puts "-- Trying to land 41st plane... --"
# airport.land(Plane.new)
