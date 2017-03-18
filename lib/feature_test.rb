=begin
USER STORY 3
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
=end

require './lib/airport'
require  './lib/weather'


weather = Weather.new
weather.report

plane = Plane.new # 1. create new object - plane
airport = Airport.new # 2. create new object - airport

airport.land(plane)
plane.land
plane.landed?

# Task - I want to instruct a plane to take off
# from an airport

airport.takeoff(plane)
plane.takeoff
plane.landed?

# Task - I want the plane to confirm it is no longer
# at the airport
