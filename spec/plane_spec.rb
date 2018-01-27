require 'plane'

describe Plane do
  subject(:plane) { Plane.new }
  let(:airport) { double("airport", land: [plane], take_off: []) }

  describe "#land" do
    it "lands the plane" do
      expect(plane.land(airport)).to eq true
    end
  end

  describe "#take_off" do
    before :each do
      plane.land(airport)
    end

    it "Takes off from the airport" do
      expect(plane.take_off(airport)).to eq false
    end
  end

end
