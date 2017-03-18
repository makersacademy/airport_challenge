=begin
USER STORY 2
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport
and confirm that it is no longer in the airport
=end

require './lib/plane'
require './lib/airport'

plane = Plane.new # 1. create new object - plane
airport = Airport.new # 2. create new object - airport

airport.land(plane)
plane.land
plane.landed?

# Task - I want to instruct a plane to take off
# from an airport

airport.takeoff(plane)

# Task - I want the plane to confirm it is no longer
# at the airport
