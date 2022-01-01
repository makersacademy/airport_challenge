require 'airport'
require 'plane'

describe Airport do
  subject (:airport) { Airport.new }

  let (:plane) { Plane.new }
  let (:land_plane) { airport.land(plane) }
  let (:plane_take_off) do
    airport.land(plane)
    airport.take_off(plane)
  end

  describe '#initialize' do
    it 'has a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe '#capacity' do
    it 'has variable capacity' do
      airport.capacity = 50
      airport.capacity.times { airport.land(Plane.new) }
      expect { land_plane }.to raise_error 'Airport full'
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'raises an error when full' do
      airport.capacity.times { airport.land(Plane.new) }
      expect { land_plane }.to raise_error 'Airport full'
    end

    it 'instructs a plane to land' do
      expect(land_plane).to eq [plane]
    end
  end

  describe '#planes' do
    it { is_expected.to respond_to :planes }

    it 'shows landed planes' do
      land_plane
      expect(airport.planes).to eq [plane]
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'instructs a plane to take off' do
      land_plane
      expect(airport.take_off(plane)).to eq plane
    end

    it 'removes a plane' do
      plane_take_off
      expect(airport.planes).not_to include(plane)
    end

    it 'does not instruct a plane that is already flying' do
      plane_take_off
      expect { airport.take_off(plane) }.to raise_error 'Plane is already in flight'
    end
  end

  describe '#weather_check' do
    it { is_expected.to respond_to(:weather) }
    
    it 'gets the weather condition' do
      expect(airport.weather).to be_an_instance_of Weather
    end
  end
end
