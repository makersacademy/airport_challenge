require "plane"

describe Plane do
  let(:plane) {Plane.new}
  let(:airport) {double(:airport, hanger: [], full?: false, stormy?: false) }

  describe "#land" do
    it "should land a plane at an airport" do
      plane.land(airport)
      expect(plane.location).to eq airport
    end
    it "should raise an error if airport is full" do
      allow(airport).to receive(:full?).and_return(true)
      expect{plane.land(airport)}.to raise_error "Airport is full"
    end
    it "should raise an error if stormy weather" do
      allow(airport).to receive(:stormy?).and_return(true)
      expect{plane.land(airport)}.to raise_error "Too stormy to land"
    end
  end

  describe "#take_off" do
    it "should put the plane in the sky" do
      plane.take_off(airport)
      expect(plane.location).to eq "sky"
    end
    it "should remove the plane from the airport hanger" do
      plane.take_off(airport)
      expect(airport.hanger).to be_empty
    end
    it "should not take off if stormy" do
      allow(airport).to receive(:stormy?).and_return(true)
      expect{plane.take_off(airport)}.to raise_error "Too stormy to take off"
    end
    it "cannot take off if already in the sky" do
      plane.land(airport)
      plane.take_off(airport)
      expect{plane.take_off(airport)}.to raise_error "Plane is skyborn"
    end
  end


end
