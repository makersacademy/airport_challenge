require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land

describe Airport do

  let(:airport) {Airport.new}

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'ready plane for take off' do

    it 'allows a plane to take off' do
      airport.ready_plane_for_take_off Plane.new
      expect(airport.landed_planes.count).to eq 0
    end
  end

  describe 'ready a plane for landing' do

    it 'allows a plane to land' do
      airport.ready_plane_for_landing Plane.new
      expect(airport.landed_planes.count).to eq 1
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'raises an error telling planes not to land' do
        subject.capacity.times { subject.ready_plane_for_landing Plane.new }
        expect { subject.traffic_control }.to raise_error 'Plane can not land, the airport is full.'
    end
  end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'when weather conditions are stormy' do
      xit 'does not allow a plane to take off'

      xit 'does not allow a plane to land'
    end
  end
end
