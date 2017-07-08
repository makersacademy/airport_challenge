require "airport"

describe Airport do

  describe "initialization" do
    it "should have a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "should be able to have a different capacity set" do
      gatwick = described_class.new(50)
      expect(gatwick.capacity).to eq 50
    end
  end

  describe "#land" do
    it "lands planes and stores them" do
      boeing = Plane.new
      subject.land(boeing)
      expect(subject.plane).to eq boeing
    end
  end

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff).with(1).argument }
end
