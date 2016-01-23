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

#Feature 2: Want to instruct a plane to take-off from airport and confirm that it is no longer at airport.

describe "take off" do
  it "planes can take off from airport" do
    airport = Airport.new
    plane = Plane.new
    #plane takes off
    airport.take_off(plane)
    expect(airport.docked(plane)).to eq false
  end
end
