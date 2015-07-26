require 'airport'
require_relative '../lib/plane'

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
  it { is_expected.to respond_to :release_plane }

  describe 'take off' do
    xit 'instructs a plane to take off'

    it 'releases a plane' do
      plane = subject.release_plane
      expect(plane).to_not be_flying
    end
  end

  describe 'landing' do
  end

  describe 'traffic control' do
    it 'has a default capacity'do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        subject.capacity.times { subject.land Plane.new }
        expect { subject.land Plane.new }.to raise_error "Airport is at max. capacity"
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

  #   context 'when weather conditions are stormy' do
  #     it { is_expected.to respond_to :weather }
  #       it 'does not allow a plane to take off' do
  #         subject.weather.release_plane
  #         expect{ subject.release_plane }.to raise_error "Airport is closed due to bad weather"
  #       end

  #     it 'does not allow a plane to land' do
  #       subject.weather.land
  #        expect{ subject.land }.to raise_error "Airport is closed due to bad weather"
  #     end
  #   end
  end
end
