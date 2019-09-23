require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane, airborne?: false, lands: nil, takes_off: nil }
  let(:airborne_plane) { double :airborne_plane, airborne?: true, lands: nil, takes_off: nil }

  before(:each) do
    allow(airport).to receive(:stormy?).and_return(false)
  end

  describe '#initialize' do
    it 'Capacity can be set on initialization' do
      test_capacity = 5
      airport = Airport.new(test_capacity)
      allow(airport).to receive(:stormy?).and_return(false)
      test_capacity.times { airport.land_plane(airborne_plane) }
      expect { airport.land_plane(airborne_plane) }.to raise_error('Cannot land, airport full')
    end
  end

  describe '#land_plane' do
    it 'When a plane lands it will enter the airport hangar' do
      airport.land_plane(airborne_plane)
      expect(airport.hangar).to include airborne_plane
    end

    it 'A plane will not land if the weather is stormy' do
      allow(airport).to receive(:stormy?).and_return(true)
      expect { airport.land_plane(airborne_plane) }.to raise_error('Cannot land in stormy weather')
    end

    it 'A plane will not land at an airport that is at full capacity' do
      Airport::DEFAULT_CAPACITY.times { airport.land_plane(airborne_plane) }
      expect { airport.land_plane(airborne_plane) }.to raise_error('Cannot land, airport full')
    end

    it 'A plane that is not airborne will not be able to land' do
      expect { airport.land_plane(plane) }.to raise_error('Plane is not airborne')
    end

  end

  describe '#takeoff_plane' do
    it 'When a plane takes off it will be removed from the airport hangar' do
      airport.hangar << plane
      airport.takeoff_plane(plane)
      expect(airport.hangar).to_not include plane
    end

    it 'A plane will not take off if the weather is stormy' do
      allow(airport).to receive(:stormy?).and_return(true)
      airport.hangar << plane
      expect { airport.takeoff_plane(plane) }.to raise_error('Cannot take off in stormy weather')
    end

    it 'A plane will not take off if it is not in the airport hangar' do
      airport.land_plane(airborne_plane)
      expect { airport.takeoff_plane(plane) }.to raise_error('Plane not at airport')
    end
  end
end
