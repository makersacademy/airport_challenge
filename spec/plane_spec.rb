require 'plane'

describe Plane do
  let(:plane) { Plane.new }

  it "lands at an airport" do
    expect { plane.land }.to_not raise_error
  end
end
