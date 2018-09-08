require 'plane'

describe Plane do
  it "lands at an airport" do
    plane = Plane.new
    airport = Airport.new
    expect(plane.land_at(airport)).to eq(airport)
  end
end
