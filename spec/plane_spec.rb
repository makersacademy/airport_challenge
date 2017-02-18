require 'plane'

describe Plane do
  it "should land at an airport" do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect(plane.airport).to eq airport
  end
end
