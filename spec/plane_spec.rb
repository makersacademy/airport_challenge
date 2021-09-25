require "plane"

describe Plane do
  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }

    it "report a plane as 'in airport', after landing" do
      airport = Airport.new
      subject.land(airport)
      expect(subject).to be_in_airport(airport)
    end
  end
  describe "#takeoff" do
    it { is_expected.to respond_to(:takeoff) }

    it "report a plane as 'not in airport', after takeoff" do
      airport = Airport.new
      subject.takeoff
      expect(subject).not_to be_in_airport(airport)
    end
  end
  it { is_expected.to respond_to(:in_airport?) }
end
