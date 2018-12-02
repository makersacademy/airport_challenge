require "airport"
require "weather"

describe Airport do

  describe "#landing_plane" do
    it "It allows planes to land" do
      plane = Plane.new
      @weather = allow(subject).to receive(:weather) { false }
      expect(subject.landing_plane(plane)).to eq [plane]
    end

    it "it prevents landings at a full airport" do
      airport = Airport.new
      plane = Plane.new
      airport.landing_plane(plane)
      expect { Airport::DEFAULT_CAPACITY.times airport.landing_plane(plane) }.to raise_error "Unable to land"
    end

    it "raises an error when you try and land the same plane multiple times at the same airport" do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:weather) { false }
      airport.landing_plane(plane)
      expect { airport.landing_plane(plane) }.to raise_error "This plane has already landed!"
    end

    it "stops plane from landing if weather is bad" do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:weather) { true }
      expect { airport.landing_plane(plane) }.to raise_error "Unable to land"
    end

  end

  describe "#take_off" do
    it "It allows planes to take off" do
      plane = Plane.new
      allow(subject).to receive(:weather) { false }
      subject.landing_plane(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it "It prevents planes taking off from an empty airport" do
      airport = Airport.new
      plane = Plane.new
      expect { airport.take_off(plane) }.to raise_error "Unable to take off"
    end

    it "it prevents plane from taking off if the weather is bad" do
      plane = Plane.new
      airport = Airport.new
      airport.landing_plane(plane)
      allow(airport).to receive(:weather) { true }
      expect { airport.take_off(plane) }.to raise_error "Unable to take off"
    end

    it "it raises an error when taking off a plane which is not at the airport" do
      easyjet = Plane.new
      ryanair = double(:plane)
      airport = Airport.new
      allow(airport).to receive(:weather) { false }
      airport.landing_plane(easyjet)
      expect { airport.take_off(ryanair) }.to raise_error "This plane is not at the airport!"
    end

  end

  describe "#initialize" do
    it "it should start wth a given capacity defined by the user" do
      airport = Airport.new(1337)
      expect(airport.capacity).to eq(1337)
    end

    it "It initializes with default capacity given no capacity" do
      airport = Airport.new
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

  end

end
