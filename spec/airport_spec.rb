require 'airport'
require 'plane'
describe 'Airport' do
  airport = Airport.new
  plane = Plane.new

  describe '#take_off' do
    it 'allows planes to take off' do
      airport = Airport.new
      airport.land(plane)
      expect(airport.take_off).to eq plane
    end
    it 'raises an error when no planes available' do
      airport = Airport.new
      expect { airport.take_off }.to raise_error 'No planes available'
    end
    it 'raises an error when the weather is stormy' do
      @weather_forecast = "Stormy"
      expect(airport.take_off(plane)).to raise_error 'No planes can
      leave due to stormy weather'
    end
  end
  describe '#land' do
    it 'allows planes to land' do
      expect(airport.land(plane)).to eq [plane]
    end
    it 'raises an error when weather is stormy' do
      airport = Airport.new
      @weatherforecast = "Stormy"
      expect { airport.land(Plane.new) }.to raise_error 'No planes can land due to stormy weather'
    end
    it 'raises an error when full' do
      airport.capacity.times do
        airport.land(Plane.new)
      end
      expect { airport.land Plane.new }.to raise_error 'Airport full'
    end
  end
  describe 'initialize' do

    it 'gives a default capacity if not passed an argument' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it 'changes the capacity if passed an argument' do
      airport = Airport.new(50)
      expect(airport.capacity).to eq 50

    end
  end
end
