require 'airport'
require 'plane'

airport = Airport.new
plane = Plane.new
plane.flying?

airport.land(plane)
plane.landed?
