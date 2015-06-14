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

  let (:plane) {Plane.new}


  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'take off' do
    it 'instructs a plane to take off if sunny' do
      allow(subject).to receive(:weather) {'sunny'}
      expect(subject).to respond_to :take_off
    end

    it 'releases a plane if sunny'do
      allow(subject).to receive(:weather) {'sunny'}
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes.count).to eq 0
    end
  end

  describe 'landing' do
    it 'instructs a plane to land if sunny' do
      allow(subject).to receive(:weather) {'sunny'}
      expect(subject).to respond_to :land
    end

    it 'receives a plane if sunny' do
      allow(subject).to receive(:weather) {'sunny'}
      subject.land(plane)
      expect(subject.planes.count).to eq 1
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land'do
        allow(subject).to receive(:weather) {'sunny'}
        subject.capacity.times{subject.land(plane)}
        expect{subject.land(plane)}.to raise_error 'The airport is full!'
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
      it 'does not allow a plane to take off' do
        allow(subject).to receive(:weather) {'sunny'}
        subject.land(plane)
        allow(subject).to receive(:weather) {'stormy'}
        expect{subject.take_off(plane)}.to raise_error 'Can\'t take off during a storm!'
      end

      it 'keeps the plane in the airport when stormy' do
        allow(subject).to receive(:weather) {'sunny'}
        subject.land(plane)
        allow(subject).to receive(:weather) {'stormy'}
        expect{subject.take_off(plane)}.to raise_error 'Can\'t take off during a storm!'
        expect(subject.planes.count).to eq 1
      end

      it 'Raises and error when trying to land during a storm' do
        allow(subject).to receive(:weather) {'stormy'}
        expect{subject.land(plane)}.to raise_error 'Can\'t land during a storm!'
      end

      it 'Does not allow a plane into the airport while stormy' do
        allow(subject).to receive(:weather) {'stormy'}
        expect{subject.land(plane)}.to raise_error 'Can\'t land during a storm!'
        expect(subject.planes.count).to eq 0
      end
    end
  end
end
