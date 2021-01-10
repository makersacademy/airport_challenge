require "airport"
require "plane"
require "weather"

describe Airport do
  subject { Airport.new(@weather) }

  before(:each) do
    @weather = double("weather")
    allow(@weather).to receive(:forecast).and_return("sunny")
  end

  describe "land" do
    it "checks if airport responds to land method" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "raises a fail if the airport is full" do
      Airport::STANDARD_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "Airport is full"
    end

    it "lands a plane" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes.include?(plane)).to eq true
    end

    it "sets plane to docked" do
      plane = Plane.new
      subject.land(plane)
      expect(plane.docked).to eq true
    end

    it "raises an error when trying to land a plane that has already landed" do
      plane = Plane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error "Already landed"
    end

    it "raises an arror when trying to land and weather is stormy" do
      plane = Plane.new
      allow(@weather).to receive(:forecast).and_return("stormy")
      expect { subject.land(plane) }.to raise_error "Can't land while stormy"
    end
  end

  describe "take off" do
    it "checks if airport responds to take off" do
      expect(subject).to respond_to(:take_off)
    end
    
    it "raises a fail if there are no planes docked" do
      expect { subject.take_off }.to raise_error "There are no planes to take off"
    end

    it "removes a plane" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
      expect(subject.planes.include?(plane)).to eq false
    end

    it "sets plane to be not docked" do
      plane = Plane.new
      subject.land(plane)
      subject.take_off
      expect(plane.docked).to eq false
    end
  end

  describe "Initialization" do
    it "sets a default capacity" do
      expect(subject.capacity).to eq Airport::STANDARD_CAPACITY
    end
    
    it "sets variable capacity" do
      airport = Airport.new(@weather, 40)
      40.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error "Airport is full"
    end

    it "raises an error if a plane tries to take off while stormy" do
      plane = Plane.new
      subject.land(plane)
      allow(@weather).to receive(:forecast).and_return("stormy")
      expect { subject.take_off }.to raise_error "Can't take off while stormy"
    end
  end
end
