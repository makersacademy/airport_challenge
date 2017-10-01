require 'airport'
require 'weather'

describe Airport do
  subject(:airport) { Airport.new }

  context 'Landing' do
    it 'lands a plane at the airport' do
      plane = Plane.new
      airport.land(plane)
      allow(airport.weather).to receive(:stormy?).and_return false
      expect(plane.landed).to be true
    end

    it 'contains the plane once landed' do
      plane = Plane.new
      airport.land(plane)
      allow(airport.weather).to receive(:stormy?).and_return false
      expect(airport.planes).to include plane
    end

    it 'raises error if landing when airport is full' do
      plane = Plane.new
      plane2 = Plane.new
      airport.land(plane)
      airport.land(plane2)
      allow(airport.weather).to receive(:stormy?).and_return false
      expect { airport.land(plane2) }.to raise_error 'Airport full!'
    end

    it 'raises error if plane is already landed' do
      plane = Plane.new
      airport.land(plane)
      allow(airport.weather).to receive(:stormy?).and_return false
      expect { airport.land(plane) }.to raise_error 'Plane already landed!'
    end

    it 'raises error if trying to land when stormy' do
      plane = Plane.new
      allow(airport.weather).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error 'Cannot land due to stormy weather'
    end
  end

  context 'Takeoff' do
    it 'lets a plane takeoff from the airport' do
      plane = Plane.new
      airport.land(plane)
      airport.takeoff(plane)
      allow(airport.weather).to receive(:stormy?).and_return false
      expect(plane.landed).to be false
    end

    it 'removes plane after takeoff' do
      plane = Plane.new
      airport.land(plane)
      airport.takeoff(plane)
      allow(airport.weather).to receive(:stormy?).and_return false
      expect(airport.planes).not_to include plane
    end

    it 'raises error if taking off when empty' do
      plane = Plane.new
      allow(airport.weather).to receive(:stormy?).and_return false
      expect { airport.takeoff(plane) }.to raise_error 'Airport empty!'
    end

    it 'raises error if plane is already airborne' do
      plane = Plane.new
      plane2 = Plane.new
      airport.land(plane)
      allow(airport.weather).to receive(:stormy?).and_return false
      expect { airport.takeoff(plane2) }.to raise_error 'Plane already airborne!'
    end

    it 'raises error if trying to takeoff when stormy' do
      plane = Plane.new
      allow(airport.weather).to receive(:stormy?).and_return true
      expect { airport.takeoff(plane) }.to raise_error 'Cannot takeoff due to stormy weather'
    end
  end
end
