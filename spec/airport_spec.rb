require 'airport'

describe Airport do

  subject(:airport) { described_class.new }

  describe '#initialize' do
    it 'Capacity can be set on initialization' do
      test_capacity = 5
      plane = double(:plane, airborne?: true, lands: nil)
      airport = Airport.new(test_capacity)
      allow(airport).to receive(:stormy?).and_return(false)
      test_capacity.times { airport.land_plane(plane) }
      expect { airport.land_plane(plane) }.to raise_error('Cannot land, airport full')
    end
  end

  describe '#land_plane' do
    it 'When a plane lands it will enter the airport hanger' do
      plane = double(:plane, airborne?: true, lands: nil)
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land_plane(plane)
      expect(airport.hanger).to include plane
    end

    it 'A plane will not land if the weather is stormy' do
      plane = double(:plane, airborne?: true)
      allow(airport).to receive(:stormy?).and_return(true)
      expect { airport.land_plane(plane) }.to raise_error('Cannot land in stormy weather')
    end

    it 'A plane will land at an airport that is at full capacity' do
      plane = double(:plane)
      allow(airport).to receive(:full?).and_return(true)
      expect { airport.land_plane(plane) }.to raise_error('Cannot land, airport full')
    end

    it 'A plane that is not airborne will not be able to land' do
      plane = double(:plane, airborne?: false)
      allow(airport).to receive(:full?).and_return(false)
      expect { airport.land_plane(plane) }.to raise_error('Plane is not airborne')
    end

  end

  describe '#takeoff_plane' do
    it 'When a plane takes off it will be removed from the airport hanger' do
      plane = double(:plane, takes_off: nil)
      allow(airport).to receive(:stormy?).and_return(false)
      airport.hanger << plane
      airport.takeoff_plane(plane)
      expect(airport.hanger).to_not include plane
    end

    it 'A plane will not take off if the weather is stormy' do
      plane = double(:plane)
      airport.hanger << plane
      allow(airport).to receive(:stormy?).and_return(true)
      expect { airport.takeoff_plane(plane) }.to raise_error('Cannot take off in stormy weather')
    end

    it 'A plane will not take off if it is not in the airport hanger' do

    end
  end
end
