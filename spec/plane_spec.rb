require 'plane'

describe Plane do

  let(:airport) { double :airport }

  describe "#land(airport)" do
    it "has landed at an airport" do
      subject.land(:airport)
      expect(subject.grounded?).to be true
    end
  end

  describe "#takeoff(airport)" do
    it "has taken off from an airport" do
      subject.takeoff(:airport)
      expect(subject.grounded?).to be false
    end
  end

  describe "#grounded?" do
    it "returns false if the plane is airborne" do
      subject.land(:airport)
      subject.takeoff(:airport)
      expect(subject.grounded?).to be false
    end
  end
end
