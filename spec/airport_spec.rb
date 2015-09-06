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
      expect(subject).to be_allow_landing
    end

    it 'receives a plane' do
      num_planes = subject.planes.count
      subject.receive_plane(plane)
      expect(subject.planes.count).to eq num_planes+1
    end

    it 'does not receive plane when full' do
      subject.capacity.times {subject.receive_plane(plane)}
      num_planes = subject.planes.count
      subject.receive_plane(plane)
      expect(subject.planes.count).to eq num_planes
    end

    xit 'raises an error if the airport is full' do
    end

    xit 'instructs a plane to land'
  end

  describe 'take off' do
    xit 'instructs a plane to take off'

    it 'releases specific plane' do
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
    context 'when airport is full' do
      xit 'does not allow a plane to land' do
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
      xit 'does not allow a plane to take off'

      xit 'does not allow a plane to land'
    end
  end
end
