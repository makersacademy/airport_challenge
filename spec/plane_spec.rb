require 'plane'

describe Plane do
  let(:plane) { Plane.new }
  let(:airport) { double Airport, receive: true, release: true }

  it "lands at the airport" do
    expect { plane.land(plane, airport) }.to_not raise_error
  end

  it "takes off from the airport" do
    expect { plane.take_off(plane, airport) }.to_not raise_error
  end
end
