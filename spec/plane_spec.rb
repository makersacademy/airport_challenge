require 'plane'
require 'airport'

describe Plane do

  let(:airport) { Airport.new }

  context "is grounded" do
    
    it "can take off from an airport" do
      expect(subject.can_takeoff(airport)).to eq true
    end

    it "cannot land at an airport" do
      expect(subject.can_land(airport)).to eq false
    end
  end

  context "is flying" do

    before do
      subject.grounded = false
    end

    it "can land at an airport" do
      expect(subject.can_land(airport)).to eq true   
    end

    it "cannot take off from an airport" do
      expect(subject.can_takeoff(airport)).to eq false
    end
  end
end
