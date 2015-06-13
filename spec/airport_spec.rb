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
      plane = double :plane
      expect(plane).to receive :take_off
      subject.take_off_plane plane
    end

    it 'releases a plane' do
      plane = double :plane, take_off: true, land: false
      subject.land_plane plane
      expect(subject.take_off_plane plane).to be plane
    end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'landing' do
    it 'instructs a plane to land' do
      plane = double :plane
      expect(plane).to receive :land
      subject.land_plane plane
    end

    it 'receives a plane' do
      plane = double :plane, land: false
      expect(subject.land_plane plane).to eq [plane]
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      xit 'does not allow a plane to land'
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
