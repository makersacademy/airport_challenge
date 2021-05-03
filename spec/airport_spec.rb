require "airport"

describe Airport do
  describe "#land" do
    it "tells planes to land" do
      allow(subject).to receive(:weather) { "clear" }
      plane = Plane.new
      subject.land(plane)
      expect(plane.state).to eq :landed
    end
    it "fails when the airport is full" do
      allow(subject).to receive(:weather) { "clear" }
      20.times {subject.land(Plane.new)}
      expect {subject.land(Plane.new)}.to raise_error "The airport is full"
    end
    it "fails when the plane is not flying" do
      allow(subject).to receive(:weather) { "clear" }
      plane = Plane.new
      plane.land
      expect {subject.land(plane)}.to raise_error "The plane has already landed"
    end
  end

  describe "#takeoff" do
    it "should tell planes to take off" do
      airport = Airport.new
      allow(airport).to receive(:weather) { "clear" }
      plane = Plane.new
      airport.land(plane)
      airport.takeoff(plane)
      expect(plane.state).to eq :flying
    end
    it "fails when the plane is not landed" do
      allow(subject).to receive(:weather) { "clear" }
      plane = Plane.new
      expect {subject.takeoff(plane)}.to raise_error "The plane is not landed at this airport"
    end
    it "fails when the plane is landed at a different airport" do
      plane = Plane.new
      airport = Airport.new
      allow(subject).to receive(:weather) { "clear" }
      allow(airport).to receive(:weather) { "clear" }
      airport.land(plane)
      expect {subject.takeoff(plane)}.to raise_error "The plane is not landed at this airport"
    end
  end

  describe "#initialize" do
    it "should have a default capacity of 20" do
      airport = Airport.new
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it "should change capacity with an argument" do
      airport =  Airport.new(30)
      expect(airport.capacity).to eq 30
    end
  end
  describe "#weather" do
    it "prevents takeoff when the weather is stormy" do
      allow(subject).to receive(:weather) { "stormy" }
      expect {subject.takeoff(Plane.new)}.to raise_error "Takeoff is prevented due to stormy conditions"
    end
    it "prevents landing when the weather is stormy" do
      allow(subject).to receive(:weather) { "stormy" }
      expect {subject.land(Plane.new)}.to raise_error "Landing is prevented due to stormy conditions"
    end
  end
end