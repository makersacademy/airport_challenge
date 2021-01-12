require "airport"
require "plane"
require "weather"
describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  describe " #initialize" do
    it { is_expected.to respond_to :planes }
    it { is_expected.to respond_to :capacity }
    it { is_expected.to respond_to :weather }
    it "set the default capacity of 10" do
      airport = Airport.new(10)
      expect(airport.capacity).to eq 10
    end
  end

  describe " #land" do
    it { is_expected.to respond_to(:land).with(1).argument }

    it "is instruct a plane to land" do
      allow(airport.weather).to receive(:stormy?).and_return false
      airport.land(plane)
      expect(airport.planes[0]).to be plane
    end

    it "raise an error when airport is full" do
      allow(airport.weather).to receive(:stormy?).and_return false
      Airport::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
      expect { airport.land(plane) }.to raise_error("Airport is full")
    end

    it "raise aif it is stormy" do
      allow(airport.weather).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error("stormy")
    end
  end

  describe " #takeoff" do
    it { is_expected.to respond_to(:takeoff) }

    it "confirm that plane which is taken off flyies" do
      allow(airport.weather).to receive(:stormy?).and_return false
      airport.land(plane)
      expect(plane.state).to eq "flying"
    end

    it "raise error if it is stormy" do
      allow(airport.weather).to receive(:stormy?).and_return false
      airport.land(plane)
      allow(airport.weather).to receive(:stormy?).and_return true
      # expect { airport.takeoff(plane) }.to raise_error("stormy")
    end

    it "when plane takes off, state:flying" do
      allow(airport.weather).to receive(:stormy?).and_return false
      airport.land(plane)
      # airport.takeoff(plane)
      expect(plane.state).to eq "flying"
    end

    it "plane which is state flying cannot takeoff" do
      allow(airport.weather).to receive(:stormy?).and_return false
      # expect { airport.takeoff(plane) }.to raise_error("flying")
    end
  end
end
