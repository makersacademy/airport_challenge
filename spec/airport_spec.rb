require "airport"

describe Airport do
  let (:airplane) {double :plane, location: :air}
  let (:groundplane) {double :plane, location: :ground}

  describe "#land" do
    it "responds to land(plane)" do
      expect { subject.to respond_to(:land).with(1).argument }
    end
  
    it "adds a plane to the hangar" do
      allow_any_instance_of(Object).to receive(:rand).and_return(4)
      allow(airplane).to receive(:ground).and_return(location: :ground)

      subject.land(airplane)
      expect(subject.hangar.count).to eq 1
    end

    it "raises an error when capacity is reached" do
      allow_any_instance_of(Object).to receive(:rand).and_return(4)
      described_class::DEFAULT_CAPACITY.times { subject.hangar.push("planes") }

      expect { subject.land(airplane) }.to raise_error "Airport is full"
    end

    it "permits a manual maximum capacity" do
      allow_any_instance_of(Object).to receive(:rand).and_return(4)
      allow(airplane).to receive(:ground).and_return(location: :ground)

      airport = Airport.new(1)
      airport.hangar.push("planestring")
      expect { airport.land(airplane) }.to raise_error "Airport is full"
    end

    it "prevents landing when stormy" do
      allow_any_instance_of(Object).to receive(:rand).and_return(13)
      expect { subject.land(airplane) }.to raise_error "It's too stormy to land!"
    end

    it "raises an error when already landed" do
      allow_any_instance_of(Object).to receive(:rand).and_return(4)
      expect { subject.land(groundplane) }.to raise_error "This plane has already landed!"
    end

  end

  describe "#take_off" do
    it "responds to take_off" do
      expect { subject.to respond_to(:take_off).with(1).argument }
    end

    it "removes a plane from the hangar" do
      allow_any_instance_of(Object).to receive(:rand).and_return(4)
      allow(groundplane).to receive(:air).and_return(location: :air)

      subject.hangar << groundplane
      expect(subject.take_off(groundplane)).to eq groundplane
    end

    it "reduces the number of planes in the hangar" do
      allow_any_instance_of(Object).to receive(:rand).and_return(4)
      3.times { subject.hangar.push("planestring") }
      allow(groundplane).to receive(:air).and_return(location: :air)
      subject.hangar << groundplane

      subject.take_off(groundplane)
      expect(subject.hangar.count).to eq 3
    end

    it "prevents take_off when stormy" do
      allow_any_instance_of(Object).to receive(:rand).and_return(1)
      subject.hangar << groundplane

      allow_any_instance_of(Object).to receive(:rand).and_return(13)
      expect { subject.take_off(groundplane) }.to raise_error "It's too stormy to take off!"
    end

    it "raises error when plane already in air" do
      allow_any_instance_of(Object).to receive(:rand).and_return(4)
      expect { subject.take_off(airplane) }.to raise_error "This plane is already in the air!"
    end

    it "raises error when plane in another airport" do
      allow_any_instance_of(Object).to receive(:rand).and_return(4)
      airport = Airport.new
      allow(groundplane).to receive(:air).and_return(location: :air)

      airport.hangar << groundplane
      expect { Airport.new.take_off(groundplane) }.to raise_error "Your plane is in another airport!"
    end

  end

end
