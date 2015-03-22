require 'airport'

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land

AIRPORT_CAPACITY = 60

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { double :plane, status: 'flying' }
  let(:landed_plane) { double :plane, status: 'landed' }

  before(:example) { allow(airport).to receive(:stormy?).and_return false }

  context 'taking off and landing' do

    it 'a plane can land' do
      expect(plane).to receive(:land)
      airport.land_plane plane
    end

    it 'a plane can take off' do
      expect(landed_plane).to receive(:take_off)
      airport.launch_plane landed_plane
    end
  end

  context 'traffic control' do

    before(:example) { allow(plane).to receive :land }
    before(:example) { allow(landed_plane).to receive :take_off }

    it 'a plane cannot land if the airport is full' do
      AIRPORT_CAPACITY.times { airport.land_plane plane }
      expect { airport.land_plane plane }.to raise_error 'Airport full'
    end

    it 'knows how many landed planes it currently has' do
      20.times { airport.land_plane plane }
      expect(airport.plane_count).to eq 20
    end

    it 'knows if it is full' do
      AIRPORT_CAPACITY.times { airport.land_plane plane }
      expect(airport).to be_full
    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'weather conditions' do

      before(:example) { allow(airport).to receive(:stormy?).and_return true }

      it 'a plane cannot take off when there is a storm brewing' do
        expect_err = 'Plane cannot take off in storm' # RuboCop insisted
        expect { airport.launch_plane landed_plane }. to raise_error expect_err
      end

      it 'a plane cannot land in the middle of a storm' do
        expect_err = 'Plane cannot land in storm' # RuboCop insisted (too long)
        expect { airport.land_plane plane }.to raise_error expect_err
      end

    end
  end
end
