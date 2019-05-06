require 'airport'
require 'plane'

airport = Airport.new
plane = Plane.new

describe Airport do
  it "lands a plane" do
    expect(airport.land(plane)).to eq(plane)
  end
end
