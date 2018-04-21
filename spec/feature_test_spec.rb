require_relative './lib/plane.rb'

def make_plane
def land_plane
  plane = Plane.new
  airport = Airport.new
    airport.land(plane)
    airport.planes == [plane]
end
