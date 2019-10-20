require 'airport'

describe Airport do
  context "When using the airport class" do
    it "should let planes land during sunny weather" do
      allow(subject).to receive(:stormy?).and_return(false)
      plane = Plane.new
      expect(subject.land(plane)).to eq(plane)
    end

    it "should let planes take off during sunny weather" do
      allow(subject).to receive(:stormy?).and_return(false)
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq(plane)
    end

    it "should confirm if a plane is at the airport" do
      allow(subject).to receive(:stormy?).and_return(false)
      plane = Plane.new
      subject.land(plane)
      expect(subject.in_airport?(plane)).to be true
    end

    it "should confirm if the weather is stormy" do
      allow(subject).to receive(:stormy?).and_return(true)
      expect(subject.stormy?).to eq(true)
    end

    it "should raise an error if a plane tries to land during stormy weather" do
      allow(subject).to receive(:stormy?).and_return(true)
      #subject.stormy = true
      plane = Plane.new
      expect { subject.land(plane) }.to raise_error "Can't land due to stormy weather!"
    end

    it "should prevent a plane from taking off if the weather is stormy" do
      allow(subject).to receive(:stormy?).and_return(false)
      plane = Plane.new
      subject.land(plane)
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.take_off(plane) }.to raise_error "Can't take off due to stormy weather!"
    end

    it "should be able to check if the hangar is full" do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.capacity.times {subject.land(Plane.new)}
      expect(subject.full?).to eq true
    end

    it "should raise an error if a plane attempts to land when the hangar is full" do
      allow(subject).to receive(:stormy?).and_return(false)
      40.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "Can't land, hangar is full!"
    end

    it "should have a default capacity" do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

    it "should raise an error when trying to land a plane that is already on ground" do
      allow(subject).to receive(:stormy?).and_return(false)
      plane = Plane.new
      subject.land(plane)
      expect{ subject.land(plane)}.to raise_error "Plane already in airport!"
    end

    it "should raise an error when trying to take off a plane that is already in the air" do
      allow(subject).to receive(:stormy?).and_return(false)
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect{subject.take_off(plane)}.to raise_error "This plane is already flying"
    end

    it "should raise an error when trying to take off a plane from an airport it isnt grounded in" do
      airport_a = Airport.new
      airport_b = Airport.new

      allow(airport_a).to receive(:stormy?).and_return(false)
      allow(airport_b).to receive(:stormy?).and_return(false)

      plane = Plane.new
      airport_a.land(plane)
      expect{airport_b.take_off(plane)}.to raise_error "This plane is not at this airport, cant take off"
    end

  end
end
