require 'airport.rb'
require 'plane.rb'
require 'weather.rb'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

describe Airport do

  describe "#land" do
    it "allows airport to land a plane" do
      storm = double(:weather)
      allow(storm).to receive(:stormy).and_return(false)
      plane = Plane.new
      expect(subject.land(plane, storm)).to eq plane
    end
  end

  describe "#land" do
    it "shows a plane plane has been landed" do
      plane = Plane.new
      storm = double(:weather)
      allow(storm).to receive(:stormy).and_return(false)
      subject.land(plane, storm)
      expect(subject.planes_airport).to eq [plane]
    end
  end

end

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

describe Airport do

  describe "#take_off" do
    it "allows plane to leave airport" do
      plane = Plane.new
      storm = double(:weather)
      allow(storm).to receive(:stormy).and_return(false)
      subject.land(plane, storm)
      expect(subject.take_off(plane, storm)).to eq plane
    end
  end

  describe "#take_off" do
    it "show plane is no longer at the airport" do
      plane = Plane.new
      storm = double(:weather)
      allow(storm).to receive(:stormy).and_return(false)
      subject.land(plane, storm)
      subject.take_off(plane, storm)
      expect(subject.planes_airport).to eq []
    end
  end

end
# As an air traffic controller
# To ensure safety
# I want to prevent take off when weather is stormy

describe Airport do

  describe "#take_off" do
    it "prevents a take off when weather is stormy" do
      plane = Plane.new
      storm = double(:weather)
      allow(storm).to receive(:stormy).and_return(true)
      subject.land(plane, storm)
      expect(subject.take_off(plane, storm)).to eq nil
    end
  end

end

# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy

describe Airport do

  describe "#land" do
    it "prevents a landing when weather is stormy" do
      plane = Plane.new
      storm = double(:weather)
      allow(storm).to receive(:stormy).and_return(true)
      expect(subject.land(plane, storm)).to eq nil
    end
  end

end

# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full

describe Airport do

  describe "#land" do
    it "prevents a landing when the airport is full" do
      subject = Airport.new("Gatwick", 1)
      plane = Plane.new
      plane2 = Plane.new
      storm = double(:weather)
      allow(storm).to receive(:stormy).and_return(false)
      subject.land(plane, storm)
      expect(subject.land(plane2, storm)).to eq nil
    end
  end

end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

describe Airport do

  describe "#CAPACITY" do
    it "if no capacity given default is 10" do
      subject = Airport.new
      expect(subject.CAPACITY).to eq 10
    end
  end

  describe "#CAPACITY" do
    it "airport capacity able to be changed by input" do
      subject = Airport.new("Gatwick", 5)
      expect(subject.CAPACITY).to eq 5
    end
  end

end
