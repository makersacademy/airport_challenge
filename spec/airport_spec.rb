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

  let(:plane) { double('plane', flying?: true) }

  describe 'take off' do
    it { expect(subject).to respond_to :instruct_take_off }

    it 'raises an error when there are no planes at the airport' do
      expect { subject.instruct_take_off }.to raise_error 'No planes available'
    end

    it 'should let a plane take off' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      allow(subject).to receive(:weather) { 'sunny' }
      subject.instruct_land plane
      subject.instruct_take_off
      expect(plane).to be_flying
    end
  end

  describe 'landing' do
    it { expect(subject).to respond_to(:instruct_land).with(1).argument }
  end

  describe 'traffic control' do
    it 'raises an error when full' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      allow(subject).to receive(:weather) { 'sunny' }
      subject.capacity.times { subject.instruct_land plane }
      expect { subject.instruct_land plane }.to raise_error 'Airport full'
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
      it 'will not allow a plane to take off' do
        allow(plane).to receive(:land)
        allow(plane).to receive(:take_off)
        subject.instruct_land plane
        allow(subject).to receive(:weather) { 'stormy' }
        expect { subject.instruct_take_off }.to raise_error 'You cannot take off now, the weather is too bad'
      end

      it 'does not allow a plane to land' do
        allow(plane).to receive(:land)
        allow(plane).to receive(:take_off)
        allow(subject).to receive(:weather) { 'stormy' }
        expect { subject.instruct_land plane }.to raise_error 'You cannot land now, the weather is too bad'
      end
    end
  end
end
