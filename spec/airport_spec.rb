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

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'take off' do

    it 'releases a plane' do
      subject.take_off
      expect(subject).to be_empty
    end
  end

  describe 'land' do

    it 'receives a plane' do
      subject.land Plane.new
      expect(subject).not_to be_empty
    end

    it 'raises an error when full' do
      subject.capacity.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error 'Plane can not land, the airport is full.'
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'raises an error telling planes not to land' do
        subject.capacity.times { subject.land Plane.new }
        expect { subject.traffic_control }.to raise_error 'Plane can not land, the airport is full.'
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
