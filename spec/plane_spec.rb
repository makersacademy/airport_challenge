require 'plane'
require 'airport'
describe Plane do

  it "lands at an airport" do
    airport = Airport.new
    plane = Plane.new(airport)
    expect(plane.land).to eq "plane has landed"
  end

  it "takes off from an airport" do
    airport2 = Airport.new
    plane2 = Plane.new(airport2)
    plane2.take_off
    expect(plane2.status).to eq "in the air"
  end

  it "does not take off when in a stormy airport" do
    airport3 = Airport.new("stormy")
    plane3 = Plane.new(airport3)
    plane3.take_off
    expect(plane3.airport).to eq airport3
  end
end
