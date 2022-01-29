require_relative '../lib/plane'
require_relative '../lib/airport'

describe Airport do

  describe "#land" do

    it "should land a plane at an airport" do
      expect(subject).to respond_to(:land)
    end

    it "should not allow a plane to land if airport is full" do
      plane1 = Plane.new
      plane2 = Plane.new
      airport = Airport.new(1)
      airport.land(plane1, airport)
      expect { airport.land(plane2, airport) }.to raise_error("airport full")
    end

    it "should not allow the same plane to land if it's already at that airport" do
      plane = Plane.new
      subject.land(plane, subject)
      expect { subject.land(plane, subject) }.to raise_error("plane already exists at airport")
    end
  end

  describe "#take_off" do

    it "should instruct a plane taking off from an airport" do
      expect(subject).to respond_to(:take_off)
    end

    it "should confirm that, following take off, the plane is no longer at the airport" do
      plane = Plane.new
      subject.land(plane, subject)
      subject.take_off(plane)
      expect(subject.take_off(plane)).to eq nil
    end
  end

  describe "#initialize" do

    it "should return the default capacity if no capacity argument set" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "should override the default capacity if passed when creating a new airport" do
      airport = Airport.new(30)
      expect(airport.capacity).to eq 30
    end
  end

  describe "#storm?" do
    
    it "should prevent take-off when the weather is stormy" do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:storm?) { true }
      expect { airport.take_off(plane) }.to raise_error("There is a storm preventing take-off") 
    end

    it "should prevent landing when the weather is stormy" do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:storm?) { true }
      expect { airport.land(plane, airport) }.to raise_error("There is a storm preventing landing")
    end
  end

end
