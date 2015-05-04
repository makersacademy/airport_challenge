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

  let(:airport) { Airport.new }
  let(:plane) { double :plane }

  context 'taking off and landing' do

    it { is_expected.to respond_to(:accept_plane).with(1).argument }
    it { is_expected.to respond_to(:launch_plane).with(1).argument }

    it 'can launch planes' do
      expect(subject.launch_plane plane).to eq plane
    end
  end

  context 'traffic control' do

    it 'should not let a plane land if the airport is full' do
      6.times { subject.accept_plane plane }
      expect { subject.accept_plane plane }.to raise_error "Airport is full"
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
      it 'a plane cannot take off when there is a storm brewing' do
        allow(subject).to receive(:stormy?) { true }
        expect { subject.launch_plane plane }.to raise_error "Stormy weather"
      end

      it 'prevents a plane from landing in the middle of a storm' do
        allow(subject).to receive(:stormy?) { true }
        expect { subject.accept_plane plane }.to raise_error "Stormy weather"
      end
    end
  end
end
