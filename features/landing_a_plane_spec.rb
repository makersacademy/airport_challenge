require 'airport'

describe "Landing Plane" do

  it "should land a plane in the airport" do
    airport = Airport.new
    plane = Plane.new
    airport.land_plane(plane)
    airport.planes
    plane.has_landed?
  end

end