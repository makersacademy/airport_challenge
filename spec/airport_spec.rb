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

  describe 'take off' do
    it { is_expected.to respond_to :take_off }

    it { is_expected.to respond_to :release_plane }
  end

  describe 'landing' do
    it { is_expected.to respond_to :land_now }

    it { is_expected.to respond_to :receive_plane }

    it { is_expected.to respond_to(:land_now).with(1).argument }
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow plane to land' do
        subject.capacity.times { subject.land_now :planes }
        expect{ subject.land_now :planes }.to raise_error 'Airport full. Can not receive more planes.'
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
      it 'does not allow plane to take off' do
        expect(subject).to receive(:weather).and_return(:stormy)
        subject.weather
        expect{subject.bad_weather_take_off}.to raise_error 'Planes can not take off in this weather'
      end

      it 'does not allow plane to land' do
        expect(subject).to receive(:weather).and_return(:stormy)
        subject.weather
        expect{subject.land_bad_weather}.to raise_error 'Planes can not take off in this weather'
      end
    end
  end
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
end
