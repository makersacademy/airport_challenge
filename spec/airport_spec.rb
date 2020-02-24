require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  let(:weather) { double :weather, stormy?: false }

  context '#land' do
    it 'lands a plane to an airport' do
      airport.land(plane, weather)
      expect(airport.planes[0]).to eq plane
    end

    it 'doesnt land if its stormy' do
      weather = double(:weather, stormy?: true)
      expect { airport.land(plane, weather) }.to raise_error 'weather is stormy, cannot land'
    end

    it 'doesnt land if airport is full' do
      Airport::CAPACITY.times { airport.land(Plane.new, weather) }
      expect { airport.land(plane, weather) }.to raise_error 'airport full, none can land'
    end

    it 'cannot land twice' do
      airport.land(plane, weather)
      expect { airport.land(plane, weather) }.to raise_error 'plane already landed'
    end
  end

  context '#take_off' do
    it 'lets a plane take off' do
      airport.land(plane, weather)
      airport.take_off(plane, weather)
      expect(airport.planes).not_to include plane
    end

    it 'doesnt take off if its stormy' do
      airport.land(plane, weather)
      weather = double(:weather, stormy?: true)
      expect { airport.take_off(plane, weather) }.to raise_error 'cannot take off while stormy'
    end

    it 'can only take off when the plane is in the airport' do
      airport.land(plane, weather)
      expect { airport.take_off(Plane.new, weather) }.to raise_error 'plane not in airport'
    end

    it 'cannot take off if plane is already flying' do
      airport.land(plane, weather)
      airport.take_off(plane, weather)
      expect { airport.take_off(plane, weather) }.to raise_error 'plane already flying'
    end
  end

  context 'capacity' do
    it 'sets capacityof airport to default' do
    expect(subject.capacity).to eq Airport::CAPACITY
    end

    it 'can override the capacity with a user input' do
      airport.capacity = 5
      expect(airport.capacity).to eq 5
    end
  end
end
