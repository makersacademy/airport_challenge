require 'airport'

describe Airport do
  describe '#land_plane' do
    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land_plane(plane)).to eq subject.hangar << plane
    end
  end
  describe '#take_off' do
    it 'lets plane take off' do
      subject.number_of_planes(3)
      expect(subject.take_off).to eq subject.flying
    end
  end
  describe 'confirmation plane has taken off' do
    it 'confirms plane has left hangar' do
      subject.number_of_planes(3)
      l = subject.hangar.length
      subject.take_off
      expect(subject.hangar.length).to eq l - 1
    end
  end
  describe 'default capacity system that can be overwritten' do
    it ' checks the default capacity can be overwritten' do
      airport = Airport.new(30)
      expect(airport.capacity).to eq 30
    end
  end
  describe 'airport full error' do
    it 'raises an error when the airport is full' do
      subject.number_of_planes(20)
      flying = Plane.new
      expect { subject.request_to_land(flying) }.to raise_error 'The hangar is currently full'
    end
  end
  describe 'no planes error' do
    it 'raises an error when there are no planes to take off' do
      expect { subject.request_take_off }.to raise_error 'There are no planes in the hangar'
    end
  end
  describe 'no take off in stormy weather' do
    it 'raises an error when a plane tries to leave in stormy weather' do
      subject.number_of_planes(1)
      weather = double('weather', :randomize => :stormy)
      expect { subject.request_take_off(weather) }.to raise_error 'You cannot leave due to stormy weather'
    end
  end
  describe 'no landing in stormy weather' do
    it 'raises an error when a plane tries to leave in stormy weather' do
      subject.number_of_planes(1)
      flying = Plane.new
      weather = double('weather', :randomize => :stormy)
      expect { subject.request_to_land(flying, weather) }.to raise_error 'You cannot land due to stormy weather'
    end
  end
  describe 'take off in sunny weather' do
    it 'checks planes can leave in sunny weather' do
      subject.number_of_planes(1)
      weather = double('weather', :randomize => :sunny)
      expect(subject.request_take_off(weather)).to eq subject.flying
    end
  end
  describe 'land in sunny weather' do
    it 'checks planes can land in sunny weather' do
      subject.number_of_planes(1)
      subject.take_off
      l = subject.hangar.length
      weather = double('weather', :randomize => :sunny)
      subject.request_to_land(subject.flying, weather)
      expect(subject.hangar.length).to eq l + 1
    end
  end
end
