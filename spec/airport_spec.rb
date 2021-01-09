require "airport"
require "plane"

describe Airport do

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
      expect(subject.planes.include?(plane)).to eq true
      expect(subject.take_off).to eq plane
      expect(subject.planes.include?(plane)).to eq false
    end
  end

  describe "Initialization" do
    it "sets a default capacity" do
      expect(subject.capacity).to eq Airport::STANDARD_CAPACITY
    end
    
    it "sets variable capacity" do
      airport = Airport.new(40)
      40.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error "Airport is full"
    end
  end

  # describe "Stormy weather" do
  #   it "raises an error when a plane tries to take_off and weather is stormy" do
  #     weather = "stormy"
  #     expect { subject.take_off(weather) }.to raise_error "Too Stormy to take off"
  #   end
  # end

end