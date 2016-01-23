require 'airport'
require 'plane'

#Feature 1: Want to instruct plane to land at airport and confirm that it has landed.

describe "planes can land at airport" do
  it "can land at airport" do
    airport = Airport.new
    plane = Plane.new
    #Land the plane
    airport.land(plane)
    #Check that the plane has landed at the airport
    expect(airport.planes).to eq plane
  end
#Check the plane is classed as 'landed'
  it "can confirm plane is landed" do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    expect(plane).to be_landed
  end
end
