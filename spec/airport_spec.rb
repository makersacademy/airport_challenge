require 'airport'

describe Airport do
  describe '#land_plane' do
    it 'lands a plane' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land_plane(plane)).to eq airport.hangar << plane
    end
  end
  describe '#take_off' do
    it 'lets plane take off' do
      airport = Airport.new(3)
      expect(airport.take_off).to eq airport.flying
    end
  end
  describe 'confirmation plane has taken off' do
    it 'confirms plane has left hangar' do
      airport = Airport.new(3)
      l = airport.hangar.length
      airport.take_off
      expect(airport.hangar.length).to eq l - 1
    end
  end
  describe 'default capacity system that can be overwritten' do
    it ' checks the default capacity can be overwritten' do
      airport = Airport.new(0, 30)
      expect(airport.capacity).to eq 30
    end
  end
  describe 'airport full error' do
    it 'raises an error when the airport is full' do
      airport = Airport.new(20)
      flying = Plane.new
      expect { airport.request_to_land(flying) }.to raise_error 'The hangar is currently full'
    end
  end
  describe 'no planes error' do
    it 'raises an error when there are no planes to take off' do
      airport = Airport.new
      expect { airport.request_take_off }.to raise_error 'There are no planes in the hangar'
    end
  end
  describe 'no take off in stormy weather' do
    it 'raises an error when a plane tries to leave in stormy weather' do
      airport = Airport.new(1)
      weather = double('weather', :randomize => 'stormy')
      expect { airport.request_take_off(weather) }.to raise_error 'You cannot leave due to stormy weather'
    end
  end
  describe 'no landing in stormy weather' do
    it 'raises an error when a plane tries to leave in stormy weather' do
      airport = Airport.new(1)
      flying = Plane.new
      weather = double('weather', :randomize => 'stormy')
      expect { airport.request_to_land(flying, weather) }.to raise_error 'You cannot land due to stormy weather'
    end
  end
end
