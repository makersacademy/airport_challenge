require "./lib/airport"

describe Airport do

  it "is created with a default plane capacity that can be overriden upon creation" do
    airport = Airport.new(10)
    expect(airport.capacity).to eq 10
  end

  it "returns true if a given plane is hanagred" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.hangared?(plane)).to be true
  end

  context "landing a plane" do

    it "responds to #land_plane" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "lands a plane and stores it in its hangar" do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end

    it "prevents a plane from landing if its hangar is full" do
      airport = Airport.new
      Airport::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error "Airport full"
    end

    it "does not allow a plane to be landed twice" do
      plane = Plane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error "Plane alredy landed here"
    end

  end

  context "getting a plane to take-off" do

    it "responds to #takeoff" do
      expect(subject).to respond_to(:takeoff).with(1).argument
    end

    it "allows a plane to take-off from its hangar and confirm it is no longer in the airport" do
      plane = Plane.new
      subject.land(plane)
      allow(subject).to receive(:stormy?).and_return(false) # force stormy weather to be false
      subject.takeoff(plane)
      expect(subject.hangar).not_to include plane
    end

    it "it prevents a plane from taking-off when the weather is stormy" do
      plane = Plane.new
      subject.land(plane)
      allow(subject).to receive(:stormy?).and_return(true) # force stormy weather to be true
      expect { subject.takeoff(plane) }.to raise_error "Cannot take-off; weather is stormy"
    end

    it "allows take-off only for planes in its hangar" do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(false) # force stormy weather to be false
      expect { subject.takeoff(plane) }.to raise_error "Plane is not hanagared at this airport"
    end

  end

end
