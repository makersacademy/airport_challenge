require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it "stores a landing plane" do
    plane.land(plane, airport)
    expect(airport.aerodrome).to include(plane)
  end
end
