require 'plane'

describe Plane do
  let(:weather1) { double :weather, condition: "sunny"}
  let(:weather2) { double :weather, condition: "stormy"}
  let(:airport1) { double :airport}
  let(:airport2) { double :airport}

  describe "#land" do 

    it "returns plane when plane successfully landed" do
      allow(airport1).to receive(:full) {false}
      allow(airport1).to receive(:planes) {[]}
      expect(subject.land(airport1, weather1)).to eq subject
    end

    it "raises an error if already landed" do
      allow(airport1).to receive(:full) {false}
      allow(airport1).to receive(:planes) {[]}
      subject.land(airport1, weather1)
      expect do
        subject.land(airport1, weather1)
      end.to raise_error("Plane already landed")
    end

    it "prevents landing when weather is stormy" do
      expect do
        subject.land(airport1, weather2)
      end.to raise_error("Can't land when weather is stormy")
    end

    it "prevents landing when airport is at capacity" do
      allow(airport2).to receive(:full) {true}
      expect do
        subject.land(airport2, weather1)
      end.to raise_error("Can't land when airport is at capacity")
    end
  end

  describe "#landed" do

    it "returns true after plane has landed" do
      allow(airport1).to receive(:full) {false}
      allow(airport1).to receive(:planes) {[]}
      subject.land(airport1, weather1)
      expect(subject.landed).to eq true
    end

    it "returns false if plane has taken off" do
      allow(airport1).to receive(:full) {false}
      allow(airport1).to receive(:planes) {[]}
      subject.land(airport1, weather1)
      subject.takeoff(airport1, weather1)
      expect(subject.landed).to eq false
    end
  end

  describe "#takeoff" do
    it "returns a plane with successfully take off" do
      allow(airport1).to receive(:full) {false}
      allow(airport1).to receive(:planes) {[]}      
      subject.land(airport1, weather1)
      expect(subject.takeoff(airport1, weather1)).to eq subject
    end
     
    it "raises an error if already taken off" do
      allow(airport1).to receive(:full) {false}
      allow(airport1).to receive(:planes) {[]}
      subject.land(airport1, weather1)
      subject.takeoff(airport1, weather1)
      expect do
        subject.takeoff(airport1, weather1)
      end.to raise_error("Plane already airborne")
    end

    it "raises an error if told to take off from wrong airport" do
      allow(airport1).to receive(:full) {false}
      allow(airport1).to receive(:planes) {[]}
      subject.land(airport1, weather1)
      expect do
        subject.takeoff(airport2, weather1)
      end.to raise_error("Plane not at this airport")

    end

    it "can't take off if the weather is stormy" do
      allow(airport1).to receive(:full) {false}
      allow(airport1).to receive(:planes) {[]}
      subject.land(airport1, weather1)
      expect do
        subject.takeoff(airport1, weather2)
      end.to raise_error("Can't take off - weather is stormy")
    end
  end
end