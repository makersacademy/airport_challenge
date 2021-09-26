require "airport"

describe Airport do
  describe "#land" do
    it { is_expected.to respond_to(:land) }
    it { is_expected.to respond_to(:land).with(1).argument }

    it "lands a new plane and returns it" do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end
  describe "#takeoff" do
    it { is_expected.to respond_to(:takeoff) }
  end
end
