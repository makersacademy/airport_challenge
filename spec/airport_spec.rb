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
  let(:plane) { double :plane }
  context 'taking off and landing' do

    it 'a plane can land' do
      expect(subject.land(plane)).to eql [plane]
    end

    it 'a plane can take off' do
      subject.land(plane)
      plane = subject.take_off
      expect(plane).to be plane
    end
  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
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
      it 'plane cannot take off, there is a storm' do
        # stormy_airport = double :airport, storm?: true
        allow(subject).to receive(:storm?) { true }
        expect { subject.storm? }.to raise_error
        'No Take Offs Due To Storm'
      end

      xit 'a plane cannot land in the middle of a storm'
    end
  end
end
