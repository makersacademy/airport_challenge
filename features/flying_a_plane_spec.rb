require 'airport'

describe "Flying Plane" do

  it "allows plane to take off from airport" do
    airport = Airport.new
    plane = Plane.new
    airport.planes << plane
    airport.fly_plane(plane)
    airport.planes
    plane.has_landed?
    plane.is_flying?
  end

end