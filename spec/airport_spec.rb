require 'airport'
require 'aeroplane'
require 'weather'

describe Airport do

  let(:airport)   { Airport.new }
  let(:plane)     { Aeroplane.new }
  let(:weather)   { Weather.new }

  it 'has a default capacity of 10' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'take_off' do
    it 'allows a plane to take off' do
      allow(airport.weather).to receive(:stormy?).and_return false
      airport.land(plane)
      airport.take_off(plane)
      expect(plane.landed).to be false
    end
    it 'raises a stormy weather error' do
      allow(airport.weather).to receive(:stormy?).and_return true
      expect { airport.take_off(plane) }.to raise_error 'Plane cannot take off due to storm!'
    end
    it 'will not release a plane when airport is empty' do
      allow(airport.weather).to receive(:stormy?).and_return false
      expect { airport.take_off(plane) }.to raise_error 'Airport empty!'
    end
    it 'removes plane from array once taken off' do
      allow(airport.weather).to receive(:stormy?).and_return false
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include plane
    end
    it 'raises error if the plane is already flying' do
      allow(airport.weather).to receive(:stormy?).and_return false
      airport.land(plane)
      expect { airport.take_off(Aeroplane.new) }.to raise_error 'This plane is on flight!'
    end
  end

  describe 'land' do
    it 'allows a plane to land in the airport' do
      allow(airport.weather).to receive(:stormy?).and_return false
      airport.land(plane)
      expect(plane.landed).to be true
    end
    it 'will not allow planes to land in stormy weather' do
      allow(airport.weather).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error 'Plane cannot land due to storm!'
    end
    it 'will not allow planes to land when airport is full' do
      allow(airport.weather).to receive(:stormy?).and_return false
      Airport::DEFAULT_CAPACITY.times { airport.land(Aeroplane.new) }
      expect { airport.land(Aeroplane.new) }.to raise_error 'Airport full!'
    end
    it 'keeps track of the plane once landed' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end
    it 'raises an error if plane has already landed' do
      allow(airport.weather).to receive(:stormy?).and_return false
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error 'This plane has already landed!'
    end
  end
end
