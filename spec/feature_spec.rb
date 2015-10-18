require 'plane'
require 'airport'

p "Instruct a plane to land at an airport"
plane = Plane.new
airport = Airport.new
plane.instructed_to_land
airport.plane_has_landed plane

p "Instruct a plane to take off"
plane.instructed_to_take_off
airport.plane_has_taken_off plane
