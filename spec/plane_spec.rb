require "plane"

describe Plane do
  let(:plane) {Plane.new}
  let(:airport) {double(:airport, hanger: []) }

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
    it "should remove the plane from the airport hanger" do
      plane.take_off
      expect(airport.hanger).to be_empty
    end
  end


end
