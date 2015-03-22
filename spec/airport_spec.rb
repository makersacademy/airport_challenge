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

  context 'taking off and landing' do

    it 'a plane can land' do
      allow(subject).to receive(:weather) { 'sunny' }
      expect(subject.plane_count).to eq(0)
      subject.land double :plane
      expect(subject.plane_count).to eq(1)
    end

    it 'a plane can take off' do
      allow(subject).to receive(:weather) { 'sunny' }
      subject.land :plane
      expect(subject.take_off).to eq :plane
    end
  end

  context 'traffic control' do

    it 'has a fixed capacity' do
      expect(subject.capacity).to eq(20)
    end

    it 'cannot take off a plane if the airport is empty' do
      allow(subject).to receive(:weather) { 'sunny' }
      expect { subject.take_off }.to raise_error 'Airport is Empty'
    end

    it 'cannot land a plane if the airport is full' do
      allow(subject).to receive(:weather) { 'sunny' }
      subject.capacity.times { subject.land :plane }
      expect { subject.land :plane }.to raise_error 'Sorry, Airport Full'
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
        allow(subject).to receive(:weather) { 'sunny' }
        subject.land :plane
        allow(subject).to receive(:weather) { 'stormy' }
        expect { subject.take_off }.to raise_error 'Impossible, Stormy Weather'
      end

      it 'a plane cannot land in the middle of a storm' do
        allow(subject).to receive(:weather) { 'stormy' }
        expect { subject.land :plane }.to raise_error 'Impossible, Stormy Weather'
      end
    end
  end
end
