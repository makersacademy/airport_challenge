require "airport"

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
      plane = double(:plane)
      allow(plane).to receive(:landed?).and_return(false)
      airport = Airport.new(weather)
      airport.capacity.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "No room to land"
    end

    it "raises an error when the plane is already landed" do
      weather = double(:weather)
      allow(weather).to receive(:stormy?).and_return(false)
      plane = double(:plane)
      allow(plane).to receive(:landed?).and_return(true)
      airport = Airport.new(weather)
      expect { airport.land(plane) }.to raise_error "Plane already landed"

    end

  end

  describe "#takeoff(plane)" do
    it "allows a plane to take off and confirm that its not at airport" do
      weather = double(:weather)
      allow(weather).to receive(:stormy?).and_return(false, false)
      plane = double(:plane)
      allow(plane).to receive(:landed?).and_return(false, true)
      airport = Airport.new(weather)
      airport.land(plane)
      expect(airport.takeoff(plane)).to eq "Takeoff"
    end

    it "raises an error when takeoff attempted during a storm" do
      weather = double(:weather)
      allow(weather).to receive(:stormy?).and_return(false, true)
      plane = double(:plane)
      allow(plane).to receive(:landed?).and_return(false)
      airport = Airport.new(weather)
      airport.land(plane)
      expect { airport.takeoff(plane) }.to raise_error "Too stormy to takeoff"
    end

    it "raises an error when the plane is already in the air" do
      weather = double(:weather)
      allow(weather).to receive(:stormy?).and_return(false)
      plane = double(:plane)
      allow(plane).to receive(:landed?).and_return(false)
      airport = Airport.new(weather)
      airport.land(plane)
      expect { airport.takeoff(plane) }.to raise_error "Plane already in the air"
    end

    it "raises an error when there are no airplanes to takeoff" do
      plane = double(:plane)
      allow(plane).to receive(:landed?).and_return(false)
      expect { subject.takeoff(plane) }.to raise_error "No planes available"
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
