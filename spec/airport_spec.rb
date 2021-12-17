require "airport"

describe Airport do
  
  describe "#land" do
    it "responds to land(plane)" do
      expect { subject.to respond_to(:land).with(1).argument }
    end
  
    it "adds a plane to the hangar" do
      allow(subject).to receive(:stormy?) { false }
      subject.land(Plane.new)
      expect(subject.hangar.count).to eq 1
    end

    it "raises an error when capacity is reached" do
      allow(subject).to receive(:stormy?) { false }
      described_class::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "Airport is full"
    end

    it "permits a manual maximum capacity" do
      airport = Airport.new(1)
      allow(airport).to receive(:stormy?) { false }
      airport.land(Plane.new)
      expect { airport.land(Plane.new) }.to raise_error "Airport is full"
    end

    it "prevents landing when stormy" do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land(Plane.new) }.to raise_error "It's too stormy to land!"
    end

    it "raises an error when already landed" do
      allow(subject).to receive(:stormy?) { false }
      plane = Plane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error "This plane has already landed!"
    end

  end

  describe "#take_off" do
    it "responds to take_off" do
      expect { subject.to respond_to(:take_off).with(1).argument }
    end

    it "removes a plane from the hangar" do
      allow(subject).to receive(:stormy?) { false }
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it "reduces the number of planes in the hangar" do
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane = Plane.new)
      3.times { subject.land(Plane.new) }
      subject.take_off(plane)
      expect(subject.hangar.count).to eq 3
    end

    it "prevents take_off when stormy" do
      allow(subject).to receive(:stormy?) { false }
      plane = Plane.new
      subject.land(plane)
      allow(subject).to receive(:stormy?) { true }
      expect { subject.take_off(plane) }.to raise_error "It's too stormy to take off!"
    end

    it "raises error when plane already in air" do
      allow(subject).to receive(:stormy?) { false }
      plane = Plane.new
      expect { subject.take_off(plane) }.to raise_error "This plane is already in the air!"
    end

    it "raises error when plane in another airport" do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { false }
      allow(subject).to receive(:stormy?) { false }
      plane = Plane.new
      airport.land(plane)
      expect { Airport.new.take_off(plane) }.to raise_error "Your plane is in another airport!"
    end

  end

  describe "#stormy?" do
    it "returns true when weather = 13" do
      allow_any_instance_of(Object).to receive(:rand).and_return(13)
      expect(subject.stormy?).to eq true
    end

    it "returns false when weather is not 13" do
      allow_any_instance_of(Object).to receive(:rand).and_return(4)
      expect(subject.stormy?).to eq nil
    end

  end

end
