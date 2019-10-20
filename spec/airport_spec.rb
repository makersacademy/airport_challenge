require 'airport'

describe Airport do
  context "When using the airport class" do
    it "should let planes land" do
      plane = Plane.new
      expect(subject.land(plane)).to eq(plane)
    end

    it "should let planes take off" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq(plane)
    end

    it "should confirm if a plane is at the airport" do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.in_airport?(plane)).to be false
    end

    it "should confirm if the weather is stormy" do
      subject.stormy = true
      expect(subject.stormy?).to be true
    end

    it "should raise an error if a plane tries to land during stormy weather" do
      subject.stormy = true
      plane = Plane.new
      expect { subject.land(plane) }.to raise_error "Can't land due to stormy weather!"
    end

    it "should prevent a plane from taking off if the weather is stormy" do
      plane = Plane.new
      subject.land(plane)
      subject.stormy = true
      expect { subject.take_off(plane) }.to raise_error "Can't take off due to stormy weather!"
    end

    it "should be able to check if the hangar is full" do
      subject.capacity.times {subject.land(Plane.new)}
      expect(subject.full?).to eq true
    end

    it "should raise an error if a plane attempts to land when the hangar is full" do
      40.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "Can't land, hangar is full!"
    end

    it "should have a default capacity" do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

    it "Planes in the airport should not be able to land while already landed" do
      plane = Plane.new
      subject.land(plane)
      expect{ subject.land(plane)}.to raise_error "Plane already in airport!"
    end

    it "should not allow planes to take off when already flying" do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect{subject.take_off(plane)}.to raise_error "This plane is already flying"
    end

  end
end
