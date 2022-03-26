require_relative '../lib/airport'
require_relative '../lib/plane'

describe Plane do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  it "lands the plane at the airport" do
    expect(plane).to respond_to(:land)
  end
  it "takes off from the airport" do
    expect(plane).to respond_to(:take_off)
  end
  it "ensures that landed planes cannot land again" do
    expect { plane.land }.to raise_error "Plane cannot land as it's already landed"
  end
  it "ensures that planes that are already flying cannot take off from an airport" do
    plane.take_off
    expect { plane.take_off }.to raise_error "This plane is currently flying"
  end
end
