require 'airport'

describe Airport do
  class Plane
  end
  let(:plane) {Plane.new}
  it "should be able to land a plane" do
    subject.land_plane(:plane)
    expect(subject.planes).to eq :plane
  end
end
