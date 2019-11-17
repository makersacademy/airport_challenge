require 'plane'

describe Plane do

  let(:airport) { double :airport }

  describe "#land(airport)" do
    it "has landed at an airport" do
      subject.land(:airport)
      expect(subject.grounded).to eq true
    end
  end

  describe "#takeoff(airport)" do
    it "has taken off from an airport" do
      subject.takeoff(:airport)
      expect(subject.grounded).to eq false
    end
  end

  describe "#grounded?" do
    it "returns true if the plane is grounded" do
      subject.land(:airport)
      expect(subject.grounded?).to eq true
    end
  end
end
