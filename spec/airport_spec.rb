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
      weather = double(:weather, stormy: false)
      allow(plane).to receive(:to_ground).and_return(false)
      expect(subject.land(plane, weather)).to eq "plane landed"
    end

    it 'instructs plane to land, but its too stormy so it raises error' do
      plane = double(:plane, flying: true)
      weather = double(:weather, stormy: true)
      expect { subject.land(plane, weather) }.to raise_error("too stormy to land")
    end

    it 'plane does not land when airport is full' do
      plane = double(:plane, flying: true)
      weather = double(:weather, stormy: false)
      airport = Airport.new(0)
      expect { airport.land(plane, weather) }.to raise_error("airport is full")
    end

    it 'planes trys to land but its not in the air' do
      plane = double(:plane, flying: false)
      weather = double(:weather, stormy: false)
      expect { subject.land(plane, weather) }.to raise_error("plane not in flight")
    end
  end

  describe '#takeoff' do

    it 'instruct plane to takeoff, it doesnt as its too stormy, returns error' do
      plane = double(:plane, flying: false)
      weather = double(:weather, stormy: true)
      expect { subject.takeoff(plane, weather) }.to raise_error("too stormy to take off")
    end

    it 'instruct plane to takeoff, it takes off' do
      plane = double(:plane, flying: false)
      weather = double(:weather, stormy: false)
      allow(plane).to receive(:to_air).and_return(false)
      expect(subject.takeoff(plane, weather)).to eq("plane has taken off")
    end

    it 'instruct plane to take off, it cant as its not in airport' do
      plane = double(:plane, flying: true)
      weather = double(:weather, stormy: false)
      expect { subject.takeoff(plane, weather) }.to raise_error("plane not grounded")
    end
  end
end
