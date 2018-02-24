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
    it 'raises and error when the airport is full' do
      airport = Airport.new(20)
      plane = Plane.new
      expect { airport.land_plane(plane) }.to raise_error 'The hangar is currently full'
    end
  end
end
