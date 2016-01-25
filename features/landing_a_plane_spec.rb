require 'plane'

describe "Landing Plane" do

  it "should land a plane" do
    airport = Airport.new
    plane = Plane.new
    airport.land_plane(plane)
    airport.planes
  end
end