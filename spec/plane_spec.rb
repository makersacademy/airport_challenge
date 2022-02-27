require 'airport'

describe Plane do
  let(:plane) { Plane.new }
  let(:airport) {Airport.new}

  it "lands at the airport" do
    expect { plane.land(plane, airport) }.to_not raise_error
  end

  it "takes off from the airport" do
    expect { plane.take_off }.to_not raise_error
  end
end
