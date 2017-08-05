require 'airport'
require 'plane'

describe Airport do
  it "has a capacity of 100 when capcity not specified" do
    airport = Airport.new
    expect(airport.capacity).to eq 100
  end

  it "registers when a plane lands" do
    airport2 = Airport.new
    plane2 = Plane.new
    plane2.land(airport2)
    expect(airport2.planes).to eq 51
  end
end
