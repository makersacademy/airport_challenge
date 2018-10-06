require "plane"

describe Plane do
  let(:plane) {Plane.new}
  let(:airport) {double(:airport) }

  describe "#land" do
    it "should land a plane at an airport" do
      plane.land(airport)
      expect(plane.location).to eq airport
    end
  end

  describe "#take_off" do
    it "should put the plane in the sky" do
      plane.take_off
      expect(plane.location).to eq "sky"
    end
  end
end
