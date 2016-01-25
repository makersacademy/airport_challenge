require 'plane'

describe Plane do
  subject(:plane) { Plane.new }
  let(:weather1) { double :weather, condition: "sunny"}
  let(:weather2) { double :weather, condition: "stormy"}
  let(:airport1) { double :airport}
  let(:airport2) { double :airport}

  describe "#land" do 
    before do
      allow(airport1).to receive(:full) {false}
      allow(airport1).to receive(:planes) {[]}
      allow(airport2).to receive(:full) {true}
      allow(airport1).to receive(:dock)
    end

    it "returns plane when plane successfully landed" do
      expect(plane.land(airport1, weather1)).to eq plane
    end

    it "raises an error if already landed" do
      plane.land(airport1, weather1)
      expect do
        plane.land(airport1, weather1)
      end.to raise_error("Plane already landed")
    end

    it "prevents landing when airport is at capacity" do
      expect do
        plane.land(airport2, weather1)
      end.to raise_error("Can't land when airport is at capacity")
    end
  end

  describe "#takeoff" do
    before do
      allow(airport1).to receive(:full) {false}
      allow(airport1).to receive(:planes) {[]}
      allow(airport1).to receive(:dock)
      allow(airport1).to receive(:undock)  
    end

    it "returns a plane with successfully take off" do
   
      plane.land(airport1, weather1)
      expect(plane.takeoff(airport1, weather1)).to eq plane
    end
     
    it "raises an error if already taken off" do
      plane.land(airport1, weather1)
      plane.takeoff(airport1, weather1)
      expect do
        plane.takeoff(airport1, weather1)
      end.to raise_error("Plane already airborne")
    end

    it "raises an error if told to take off from wrong airport" do
      plane.land(airport1, weather1)
      expect do
        plane.takeoff(airport2, weather1)
      end.to raise_error("Plane not at this airport")
    end
  end

  context "when weather is stormy" do
    before do
      allow(airport1).to receive(:full) {false}
      allow(airport1).to receive(:planes) {[]}
      allow(airport1).to receive(:dock)
    end

    it "prevents landing" do
      expect do
        plane.land(airport1, weather2)
      end.to raise_error("Can't land when weather is stormy")
    end

    it "can't take off" do
      plane.land(airport1, weather1)
      expect do
        plane.takeoff(airport1, weather2)
      end.to raise_error("Can't take off - weather is stormy")
    end
  end
end