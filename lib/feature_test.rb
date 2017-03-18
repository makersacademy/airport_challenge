=begin
USER STORY 3
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
=end

require './lib/airport'
require  './lib/weather'

plane = Plane.new
airport = Airport.new

weather = Weather.new

airport.land(plane)
weather.report

# I want to prevent takeoff when weather is stormy
airport.takeoff(plane)
