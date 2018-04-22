require 'plane'
require 'airport'

def take_off
  plane = Plane.new
  airport = Airport.new
  airport.lane(plane)
  airport.take_off(plane)
  airport.planes == []
end
    