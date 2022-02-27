require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it "receives and stores a landing plane" do
    airport.receive_plane(plane)
    expect(airport.aerodrome).to include(plane)
  end
end
