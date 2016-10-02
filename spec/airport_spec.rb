require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  it "responds to land" do
    expect(airport).to respond_to(:land).with(1).argument
  end
  it "lands plane in airport" do
    expect(airport.land(plane)).to include(plane)
  end
  it "responds to take-off" do
    expect(airport).to respond_to(:take_off).with(1).argument
  end
end
