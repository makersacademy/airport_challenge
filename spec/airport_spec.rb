require "airport"
require "plane"

describe Airport do

  describe "#land(plane)" do
    it "raises an error when landing attempted during a storm" do
      weather = double(:weather)
      allow(weather).to receive(:stormy?).and_return(true)
      airport = Airport.new(weather)
      plane = Plane.new
      expect { airport.land(plane) }.to raise_error "Too stormy to land"
    end

    it "raises an error when there is no room to land" do
      weather = double(:weather)
      allow(weather).to receive(:stormy?).and_return(false)
      plane = Plane.new
      airport = Airport.new(weather)
      airport.capacity.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "No room to land"
    end
  end

  describe "#takeoff" do
    it "allows a plane to take off and confirm that its not at airport" do
      weather = double(:weather)
      allow(weather).to receive(:stormy?).and_return(false)
      plane = Plane.new
      airport = Airport.new(weather)
      airport.land(plane)
      expect(airport.takeoff).to eq "Takeoff"
    end

    it "raises an error when takeoff attempted during a storm" do
      weather = double(:weather)
      allow(weather).to receive(:stormy?).and_return(false, true)
      plane = Plane.new
      airport = Airport.new(weather)
      airport.land(plane)
      expect { airport.takeoff }.to raise_error "Too stormy to takeoff"
    end

    it "raises an error when there are no airplanes to takeoff" do
      expect { subject.takeoff }.to raise_error "No planes available"
    end
  end

  it "has a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "has a default capacity that can be overridden as appropriate" do
    airport = Airport.new
    airport.capacity = 25
    expect(airport.capacity).to eq 25
  end
end
