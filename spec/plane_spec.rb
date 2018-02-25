require 'airport'
require 'plane'

describe Plane do
  it "should change its status to ground when it lands" do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    expect(plane.status).to eq "ground"
  end
  it "should have an automatic status of 'air'" do
    plane = Plane.new
    expect(plane.status).to eq "air"
  end
end
