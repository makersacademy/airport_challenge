require "airport"

describe Airport do
  describe "#hangar" do
    it "creates a hangar to store planes" do
      expect(subject.hangar).to eq []
    end
  end

  describe "#land" do
    it { is_expected.to respond_to(:land) }
    it { is_expected.to respond_to(:land).with(2).arguments }

    it "lands a new plane and adds to hangar" do
      plane = Plane.new
      weather = Weather.new
      subject.land(plane, weather)
      expect(subject.hangar.last).to eq plane
    end
  end
  describe "#takeoff" do
    it { is_expected.to respond_to(:takeoff) }

    it "removes plane from hangar after taking off" do
      plane = Plane.new
      weather = Weather.new
      subject.land(plane, weather)
      subject.takeoff
      expect(subject.hangar).not_to include plane
    end
  end
end
