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
    it 'instructs a plane to take off' do
      plane = double :plane, land: false
      allow(subject).to receive(:weather){:sunny}
      subject.land_plane plane
      expect(plane).to receive :take_off
      subject.take_off_plane plane
    end

    it 'releases a plane' do
      plane = double :plane, take_off: true, land: false
      allow(subject).to receive(:weather){:sunny}
      subject.land_plane plane
      expect(subject.take_off_plane plane).to be plane
    end

    it 'raises an error when empty' do
      plane = double :plane, take_off: true
      expect{subject.take_off_plane plane}.to raise_error 'No planes available'
    end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'landing' do
    it 'instructs a plane to land' do
      plane = double :plane
      allow(subject).to receive(:weather){:sunny}
      expect(plane).to receive :land
      subject.land_plane plane
    end

    it 'receives a plane' do
      plane = double :plane, land: false
      allow(subject).to receive(:weather){:sunny}
      expect(subject.land_plane plane).to eq [plane]
    end

  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'prevents plane from landing' do
        plane = double :plane, land: false
        allow(subject).to receive(:weather){:sunny}
        subject.capacity.times {subject.land_plane plane}
        expect{subject.land_plane plane}.to raise_error 'Airport is full'
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
      let(:plane) {double :plane, land: false, take_off: true}

      it 'does not allow a plane to take off' do
        allow(subject).to receive(:weather){:sunny}
        subject.land_plane plane
        allow(subject).to receive(:weather){:stormy}
        expect{subject.take_off_plane plane}.to raise_error 'stormy weather cannot take off'
      end

      it 'does not allow a plane to land' do
        allow(subject).to receive (:weather) {:stormy}
        expect{subject.land_plane plane}.to raise_error 'stormy weather cannot land'
      end
    end
  end
end
