=begin
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
and confirm that it has landed
=end

require './lib/plane'
require './lib/airport'

plane = Plane.new # 1. create new object - plane
airport = Airport.new # 2. create new object - airport


# Task - I want to instruct a plane to land at an airport
# plane.land(airport)
