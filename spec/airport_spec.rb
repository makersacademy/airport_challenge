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
  # let(:flying_plane) { double :plane, land: 'landed' }
  let(:plane) { Plane.new }
  context 'taking off and landing' do
    it 'can land a plane' do
      expect(subject.land(plane)).to eql plane
    end

    it 'can release planes for #take_off' do
      subject.land(plane)
      subject.take_off
      expect(subject.planes).to eq []
    end
  end

  context 'traffic control' do

    it 'cannot allow planes to land if the airport is #full' do
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Airport Full'
    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
    # This tells the die object to return the value 3 when it receives the roll
    # message.
    context 'weather conditions' do
      it ' cannot allow planes to take off due to a storm' do
        subject.land(plane)
        allow(subject).to receive(:storm?).and_return(true)
        expect { subject.take_off }.to raise_error 'No Take Off Due To Storm'
        # stormy_airport = double :airport, storm?: true
        # allow(subject).to receive(:storm?) { true }
        # expect { subject.storm? }.to raise_error
        # 'No Take Offs Due To Storm'
      end

      it 'cannot allow planes to land due to storm' do
        allow(subject).to receive(:storm?).and_return(true)
        expect { subject.land(plane) }.to raise_error 'No Landing Due To Storm'
      end
    end
  end
end
