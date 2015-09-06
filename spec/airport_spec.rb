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

  let(:plane){double(:plane)}

  it 'has a default capacity' do
    expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
  end

  describe 'landing' do

    it 'allows planes to land' do
      allow(subject.weather).to receive(:stormy?) {false}
      expect(subject).to be_allow_landing
    end

    it 'receives a plane' do
      allow(subject.weather).to receive(:stormy?) {false}
      num_planes = subject.planes.count
      subject.receive_plane(plane)
      expect(subject.planes.count).to eq num_planes+1
    end

  end

  describe 'take off' do

    it 'releases specific plane' do
      allow(subject.weather).to receive(:stormy?) {false}
      p1 = double :p1
      p2 = double :p2
      p3 = double :p3
      subject.receive_plane (p1)
      subject.receive_plane (p2)
      subject.receive_plane (p3)
      expect(subject.release_plane(p2)).to eq p2
    end

  end

  describe 'traffic control' do
    describe 'when airport is full' do

      it 'does not allow a plane to land' do
        allow(subject.weather).to receive(:stormy?) {false}
        subject.capacity.times {subject.receive_plane(plane)}
        expect(subject).not_to be_allow_landing
      end

      it 'does not receive plane' do
        allow(subject.weather).to receive(:stormy?) {false}
        subject.capacity.times {subject.receive_plane(plane)}
        num_planes = subject.planes.count
        subject.receive_plane(plane)
        expect(subject.planes.count).to eq num_planes
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

    describe 'stormy weather' do

      it 'checks for stormy weather before allowing landing' do
        expect(subject.weather).to receive :stormy?
        subject.allow_landing?
      end

      it 'doesn\'t allow landing in stormy weather' do
        allow(subject.weather).to receive(:stormy?) {true}
        expect(subject).not_to be_allow_landing
      end

      it 'doesn\'t allow taking off in stormy weather' do
        allow(subject.weather).to receive(:stormy?) {true}
        expect(subject).not_to be_allow_take_off
      end

    end

  end

end
