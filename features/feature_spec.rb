require 'airport'
require 'plane'

#Feature 1: Want to instruct plane to land at airport and confirm that it has landed.

describe "landing" do
  it "planes can land at airport" do
    airport = Airport.new
    plane = Plane.new
    #Land the plane
    airport.land(plane)
    expect(plane).to be_landed
  end
end
