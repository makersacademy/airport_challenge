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

  describe 'taking off' do
    context 'instructs a plane to take off' do
      it { is_expected.to respond_to(:instruct_take_off).with(1).argument }

      xit 'tells take_off_plane to prepare_to_take_off' do
        take_off_plane = Plane.new
        take_off_plane.flying = false
        expect(subject.instruct_take_off(take_off_plane)).to eq true
      end
    end

    xit 'releases a plane'
  end

  describe 'landing' do
    context 'instructing a plane to land' do
      it { is_expected.to respond_to(:instruct_landing).with(1).argument }

      it 'tells landing_plane to prepare_to_land' do
        landing_plane = Plane.new
        expect(subject.instruct_landing(landing_plane)).to eq true
      end
    end

    context 'receiving a plane' do
      it {is_expected.to respond_to(:receive).with(1).argument }

      it 'receives a plane if that plane can land' do
        landing_plane = Plane.new
        subject.instruct_landing(landing_plane)
        expect(subject.receive(landing_plane)).to eq false
      end
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      xit 'does not allow a plane to land'
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
