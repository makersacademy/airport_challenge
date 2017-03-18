=begin
USER STORY 3
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
=end

require './lib/plane'
require './lib/airport'
require './lib/weather'

plane = Plane.new
airport = Airport.new
weather = Stormy_Weather.new.report

# I want to prevent landing when weather is stormy
airport.land(plane)
