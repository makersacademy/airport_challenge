require_relative '../lib/plane'
require_relative '../lib/airport'

def land_plane
  plane = Plane.new
  airport = Airport.new
  airport.land(plane)
  airport.planes == [plane]
end

def takeoff_plane
  plane = Plane.new
  airport = Airport.new
  airport.land(plane)
  airport.takeoff(plane)
  airport.planes == []
end
