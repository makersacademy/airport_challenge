require 'airport'

describe Airport do 
  context "land plane" do 
    it "is expected to add plane to planes in airport" do
      plane = Plane.new
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      expect(subject.planes).to include plane
    end
    it "should return an error if a plane is attempted to be landed when the airport is full" do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { false }
      airport.capacity.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error "Airport is full"
    end
    it "should return an error if a plane that is already landed is attempted to be landed" do
      plane = Plane.new
      airport = Airport.new 
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error "Plane has already landed"
    end
  end
  context "takeoff" do
    it "expects a plane to takeoff and no longer be in the airport" do 
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      airport.takeoff
      expect(airport.planes).not_to include plane
    end
    it "expects takeoff to be impossible if there are no planes in an airport" do
      expect { Airport.new.takeoff }.to raise_error "There are no planes"
    end
  end
  context "airport capacity" do 
    it "should allow the setting of airport capacity" do
      airport = Airport.new(57)
      expect(airport.capacity).to eq 57
    end
    it "should revert to the default capacity if no capacity is specififed" do
      airport = Airport.new
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end
  context "stormy?" do
    it "should check storminess returns true or false" do
      airport = Airport.new
      expect(airport.stormy?).to eq(true).or eq(false)
    end
    it "Should prevent planes taking off if weather is stormy" do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      allow(airport).to receive(:stormy?) { true }
      expect { airport.takeoff }.to raise_error "It is too stormy to takeoff"
    end
    it "Should prevent planes landing if weather is stormy" do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:stormy?) { true }
      expect { airport.land(plane) }.to raise_error "It is too stormy to land"
    end
  end
end
