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

  describe 'airport' do
    it 'does an airport have some capacity' do
      expect(subject).to respond_to :capacity
    end
  end

  describe 'take off' do
    it 'allows planes to take off' do
      expect(subject).to respond_to :permission_fly?
    end
  end

  describe 'landing' do
    it 'allows planes to land' do
      expect(subject).to respond_to :permission_land?
    end
    it 'increase inventory when plane lands' do
      plane = Plane.new
      expect { plane.land subject }.to change{ subject.plane_size }.from(0).to(1)
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        20.times {subject.plane_in Plane.new}
        expect{ subject.plane_in Plane.new }.to raise_error "No more space at the airport"
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
