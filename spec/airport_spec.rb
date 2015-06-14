require 'airport'
require 'plane'

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

  describe 'take off' do
    it 'instructs a plane to take off' do
      plane = double :plane
      expect(plane).to receive :takeoff
      subject.instruct_plane_to_take_off plane
    end

    it 'releases a plane' do
      plane = Plane.new
      subject.instruct_plane_to_land plane
      released_plane = subject.release_plane plane
      expect(released_plane).to eq plane
    end

  end

  describe 'landing' do
    it 'instructs a plane to land' do
      plane = double :plane
      expect(plane).to receive :land
      subject.instruct_plane_to_land plane
    end

    it 'receives a plane' do
    plane = Plane.new
    subject.instruct_plane_to_land plane
    expect(subject).not_to be_empty
    end

  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        subject.capacity.times { subject.receive_plane double(:plane) }
        expect { subject.receive_plane double(:plane) }.to raise_error "Airport Full"
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
