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

  let(:plane){ double :plane}

  describe 'take_off' do
    it { is_expected.to respond_to(:take_off_plane) }

    it 'should reduce a plane in the panes array' do
      allow(subject).to receive(:weather).and_return(:sunny)
      subject.land(plane)
      subject.take_off_plane
      expect(subject.planes.count).to eq 0
    end
  end

  describe 'landing' do
    it { is_expected.to respond_to :land }
    it { is_expected.to respond_to(:land).with(1).argument }
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        allow(subject).to receive(:weather).and_return(:sunny)
        subject.capacity.times { subject.land(plane) }
        expect{ subject.land(plane) }.to raise_error 'Airport full.'
    end
  end

  context 'when weather conditions are stormy' do
    it 'does not allow plane to take off' do
      allow(subject).to receive(:weather).and_return(:sunny)
      subject.land(plane)
      allow(subject).to receive (:weather).and_return(:stormy)
      subject.weather
      expect{subject.take_off}.to raise_error 'Stormy weather.'
    end

    it 'does not allow plane to land' do
      allow(subject).to receive(:weather).and_return(:stormy)
      subject.weather
      expect{subject.land(plane)}.to raise_error 'Stormy weather.'
    end

    it 'makes the weather stormy' do
      subject.weather
      expect(subject.weather).to eq(:stormy).or eq(:sunny)
    end
  end
end

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
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
