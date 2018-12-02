require "airport"
require "weather"

describe Airport do

  describe "#landing" do
    it "It allows planes to land" do
      plane = Plane.new
    # Will land when weather isn't stormy - 60% of the time
      @weather = allow(subject).to receive(:weather) { false }
      expect(subject.landing_plane(plane)).to eq [plane]
    end
    # shamelessly stole the below from my boris-bike task file
    it "it prevents landings at a full airport" do
      airport = Airport.new
      airport.landing_plane(Plane.new)
      expect { Airport::DEFAULT_CAPACITY.times airport.landing_plane(Plane.new) }.to raise_error "Unable to land"
    end
  end

  describe "#take_off" do
    it "It allows planes to take off" do
      plane = Plane.new
      # bad weather prevents planes taking off
      allow(subject).to receive(:weather) { false }
      subject.landing_plane(plane)
      expect(subject.take_off).to eq plane
    end

    it "It prevents planes taking off from an empty airport" do
      airport = Airport.new
      expect { airport.take_off }.to raise_error "Unable to take off"
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
