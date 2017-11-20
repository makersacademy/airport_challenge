require 'airport'
require 'plane'

airport = Airport.new
plane = Plane.new
weather = Weather.new
plane.flying?

airport.land(plane, weather)
plane.landed?

airport.take_off(plane)
plane.flying?
