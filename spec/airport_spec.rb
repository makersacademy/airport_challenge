require 'airport'

describe Airport do
  describe "landing plane tests" do
    it { is_expected.to respond_to(:land).with(1).argument }
  end

  it "returns the landed plane" do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

end
