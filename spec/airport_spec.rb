require 'airport'

describe Airport do

  subject(:airport) { described_class.new }

  describe '#initialize' do
    it 'Capacity can be set on initialization' do
      test_capacity = 5
      plane = double(:plane, airborne?: true, lands: nil)
      airport = Airport.new(test_capacity)
      weather = double(:weather, stormy?: false)
      test_capacity.times { airport.land_plane(plane, weather) }
      expect { airport.land_plane(plane, weather) }.to raise_error('Cannot land, airport full')
    end
  end

  describe '#land_plane' do
    it 'When a plane lands it will enter the airport hanger' do
      plane = double(:plane, airborne?: true, lands: nil)
      weather = double(:weather, stormy?: false)
      airport.land_plane(plane, weather)
      expect(airport.hanger).to include plane
    end

    it 'A plane will not land if the weather is stormy' do
      plane = double(:plane, airborne?: true)
      weather = double(:weather, stormy?: true)
      allow(airport).to receive(:stormy?).and_return(true)
      expect { airport.land_plane(plane, weather) }.to raise_error('Cannot land in stormy weather')
    end

    it 'A plane will not land at an airport that is at full capacity' do
      plane = double(:plane)
      allow(airport).to receive(:full?).and_return(true)
      weather = double(:weather, stormy?: false)
      expect { airport.land_plane(plane, weather) }.to raise_error('Cannot land, airport full')
    end

    it 'A plane that is not airborne will not be able to land' do
      plane = double(:plane, airborne?: false)
      weather = double(:weather, stormy?: false)
      allow(airport).to receive(:full?).and_return(false)
      expect { airport.land_plane(plane, weather) }.to raise_error('Plane is not airborne')
    end

  end

  describe '#takeoff_plane' do
    it 'When a plane takes off it will be removed from the airport hanger' do
      plane = double(:plane, takes_off: nil)
      weather = double(:weather, stormy?: false)
      airport.hanger << plane
      airport.takeoff_plane(plane, weather)
      expect(airport.hanger).to_not include plane
    end

    it 'A plane will not take off if the weather is stormy' do
      plane = double(:plane)
      airport.hanger << plane
      weather = double(:weather, stormy?: true)
      expect { airport.takeoff_plane(plane, weather) }.to raise_error('Cannot take off in stormy weather')
    end

    it 'A plane will not take off if it is not in the airport hanger' do
      plane = double(:plane, airborne?: true, lands: nil)
      plane2 = double(:plane, airborne?: true, lands: nil)
      weather = double(:weather, stormy?: false)
      airport.land_plane(plane2, weather)
      expect { airport.takeoff_plane(plane, weather) }.to raise_error('Plane not at airport')
    end
  end
end
