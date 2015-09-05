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

  let(:plane) { double :plane, flying?: true}

  describe 'take off' do

    it { is_expected.to respond_to(:release_plane) }

    it "raises error when there are no planes available" do
      expect(subject.release_plane).to eq(false)
    end

    it 'releases a plane' do
      allow(subject).to receive(:stormy?){false}
      subject.dock(plane)
      subject.release_plane
      expect(subject.planes.empty?).to eq(true)
    end
  end

  describe 'landing' do
    it 'instructs a plane to land' do
      is_expected.to respond_to(:dock).with(1).argument
    end

    it 'receives a plane' do
      allow(subject).to receive(:stormy?){false}
      subject.dock(plane)
      expect(subject.planes.any?).to eq(true)
    end

  end

  describe 'traffic control' do
    context 'when airport is full' do

      it "has a default capacity" do
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end

      it "raises an error when airport is full" do
        allow(subject).to receive(:stormy?){false}
        subject.capacity.times { subject.dock plane }
        expect { subject.dock plane }.to raise_error 'Airport unavailable'
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
        allow(subject).to receive(:stormy?).and_return(true)
        expect(subject.release_plane).to eq(false)
      end

      it 'does not allow a plane to land' do
        allow(subject).to receive(:stormy?).and_return(true)
        expect{ subject.dock plane }.to raise_error 'Airport unavailable'
      end
    end
  end
end
