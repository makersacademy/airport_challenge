require "airport"

describe Airport do
  describe "#hangar" do
    it "creates a hangar to store planes" do
      expect(subject.hangar).to eq []
    end
  end

  describe "#land" do
    it { is_expected.to respond_to(:land) }
    it { is_expected.to respond_to(:land).with(1).argument }

    it "lands a new plane and adds to hangar" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.hangar.last).to eq plane
    end
  end
  describe "#takeoff" do
    it { is_expected.to respond_to(:takeoff) }
  end
end
