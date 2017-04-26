require "Plane"

describe Plane do
  subject(:plane) {described_class.new}
  let (:airport) {double :airport}

  describe "#flying?" do

    it "plane flying at initialization" do
      expect(plane).to be_flying
    end

    it "can also return false if plane is grounded" do
      airport = double(:airport, land: "Landed Successfully")
      plane.land_at(airport)
      expect(plane).not_to be_flying
    end
  end

  describe "#land_at" do

    it "can't land if already grounded" do
      airport = double(:airport, land: "Landed Successfully")
      plane.land_at(airport)
      expect{plane.land_at(airport)}.to raise_error("Plane already grounded")
    end
  end

  describe "#takeoff" do

    it "makes the plane take-off" do
      allow(airport).to receive(:land) {"Plane already grounded"}
      plane.land_at(airport)
      plane.take_off(airport)
      expect(plane).to be_flying
    end

    it "Can't take off if it's already flying" do
      expect{ plane.take_off(airport)}.to raise_error("Plane already in flight")
    end
  end
end
