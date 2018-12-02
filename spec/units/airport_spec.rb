require 'airport'

RSpec.describe Airport do
  describe '#land' do
    it 'instructs a plane to land' do
      weather = double('weather')
      allow(weather).to receive(:stormy?).and_return(false)
      airport = Airport.new(weather: weather)
      plane = double('a plane', land: nil)

      expect(airport.land(plane)).to eq [plane]
    end

    it 'sends message to plane to land' do
      weather = double('weather')
      allow(weather).to receive(:stormy?).and_return(false)
      airport = Airport.new(weather: weather)
      plane = double('a plane', land: nil)

      expect(plane).to receive(:land)

      airport.land(plane)
    end
  end

  describe '#takeoff' do
    it 'instructs a plane to takeoff' do
      weather = double('weather')
      allow(weather).to receive(:stormy?).and_return(false)
      airport = Airport.new(weather: weather)
      plane = double('a plane', land: nil, takeoff: nil)
      airport.land(plane)

      expect(airport.takeoff(plane)).to eq plane
    end

    it 'sends message to plane to take off' do
      weather = double('weather')
      allow(weather).to receive(:stormy?).and_return(false)
      airport = Airport.new(weather: weather)
      plane = double('a plane', land: nil, takeoff: nil)
      airport.land(plane)

      expect(plane).to receive(:takeoff)

      airport.takeoff(plane)
    end

    it 'can not take off a plane that is not there' do
      weather = double('weather')
      allow(weather).to receive(:stormy?).and_return(false)
      airport = Airport.new(weather: weather)
      plane = double('a plane', land: nil, takeoff: nil)

      expect { airport.takeoff(plane) }.to raise_error('Plane not here')
    end
  end

  describe 'capacity' do
    it 'can be set when needed' do
      weather = double('weather')
      allow(weather).to receive(:stormy?).and_return(false)
      airport = Airport.new(capacity: 2, weather: weather)
      plane = double('a plane', land: nil)

      expect(airport.land(plane)).to eq [plane]
    end

    it 'raises an error when trying to land at capacity' do
      weather = double('weather')
      allow(weather).to receive(:stormy?).and_return(false)
      airport = Airport.new(capacity: 1, weather: weather)
      plane = double('a plane', land: nil)
      airport.land(plane)

      expect { airport.land(plane) }.to raise_error('Airport full')
    end
  end
end
