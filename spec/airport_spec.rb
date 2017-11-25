require 'airport'
require 'plane'

describe Airport do
  let(:plane) { double(:plane) }

  it "should land a plane at an airport" do
    expect(subject.land(plane)).to eq plane
  end
end
