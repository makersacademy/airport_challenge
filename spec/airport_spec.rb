require 'airport'
require 'plane'

describe Airport do

  describe '#initialize' do
    it 'initializes with default capacity of 100' do
      expect(Airport.new.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'initializes with (10) custom capacity' do
      expect(Airport.new(10).capacity).to eq 10
    end
  end

  describe '#land' do

    it 'instruct plane to land at airport, it lands as weather is not stormy' do
      plane = double(:plane, flying: true)
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject.land(plane)).to eq "plane landed"
    end

    it 'instructs plane to land, but its too stormy so it raises error' do
      plane = double(:plane, flying: true)
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.land(plane) }.to raise_error("too stormy to land")
    end

    it 'plane does not land when airport is full' do
      plane = double(:plane, flying: true)
      airport = Airport.new(0)
      allow(airport).to receive(:stormy?).and_return(false)
      expect { airport.land(plane) }.to raise_error("airport is full")
    end

    it 'planes trys to land but its not in the air' do
      plane = double(:plane, flying: false)
      expect { subject.land(plane) }.to raise_error("plane not in flight")
    end
  end

  describe '#takeoff' do

    it 'instruct plane to takeoff, it doesnt as its too stormy, returns error' do
      plane = double(:plane)
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.takeoff(plane) }.to raise_error("too stormy to take off")
    end

    it 'instruct plane to takeoff, it takes off' do
      plane = double(:plane)
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject.takeoff(plane)).to eq("plane has taken off")
    end
  end
end
