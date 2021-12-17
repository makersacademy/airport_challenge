require "airport"

describe Airport do
  
  describe "#land" do
    it "responds to land(plane)" do
      expect { subject.to respond_to(:land).with(1).argument }
    end
  
    it "adds a plane to the hangar" do
      plane = Plane.new
      expect(subject.land(plane)[0]).to eq plane
    end

    it "raises an error when capacity is reached" do
      described_class::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect{ subject.land(Plane.new) }.to raise_error "Airport is full"
    end

    it "permits a manual maximum capacity" do
      airport = Airport.new(1)
      airport.land(Plane.new)
      expect{ airport.land(Plane.new) }.to raise_error "Airport is full"
    end
  end

  describe "#take_off" do
    it "responds to take_off" do
      expect{ subject.to respond_to(:take_off).with(1).argument }
    end

    it "removes a plane from the hangar" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it "prevents take_off when stormy" do
      plane = Plane.new
      subject.land(plane)
      allow(subject).to receive(:stormy?){ true }
      expect{ subject.take_off(plane) }.to raise_error "It's too stormy to take off!"
    end
  end
end
