require 'airport'

describe "Stormy Weather" do

  it "should not allow planes to take off or land" do
    airport = Airport.new
    plane = Plane.new
    airport2 = Airport.new
    plane2 = Plane.new
    airport.stormy?
    airport.ground_planes
    airport.land_plane(plane)
    airport2.fly_plane(plane2)
  end

end