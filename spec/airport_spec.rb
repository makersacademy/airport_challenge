require 'airport'

describe Airport do
  let(:plane) { double :plane}
  
  describe "#land" do
    it "lets a plane land at an airport" do
      allow(plane).to receive(:flying=) { :false }
      subject.land(plane)
      expect(subject.planes).to include plane
    end

    it "confirms that the plane is no longer flying" do
      allow(plane).to receive(:flying=) { :false }
      allow(plane).to receive(:flying) { false }
      subject.land(plane)
      expect(plane.flying).to eq false
    end
  end

  describe "#take_off" do
    it "instructs a plane to take off" do
      allow(plane).to receive(:flying=) { :false }
      subject.land(plane)
      
      expect(subject.take_off(plane)).to eq plane
    end

    it "plane is no longer in airport" do
      allow(plane).to receive(:flying=) { :false }
      subject.land(plane)

      subject.take_off(plane)
      expect(subject.planes).to_not include plane
    end

    it "tells the plane that it is no longer landed" do
      allow(plane).to receive(:flying=) { :false }
      subject.land(plane)

      subject.take_off(plane)
      allow(plane).to receive(:flying=) { :true }
      allow(plane).to receive(:flying) { true }
      expect(plane.flying).to eq true
    end
  end

end
