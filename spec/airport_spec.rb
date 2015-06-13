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

  it {is_expected.to respond_to(:landing).with(1).argument }

  it 'has a capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'take off' do

    it 'releases a plane' do
      plane = Plane.new
      subject.landing plane
      subject.requesting_take_off
      expect(subject.empty?).to eq true
    end

    it 'instructs a plane to take off' do
      plane = Plane.new
      subject.landing plane
      subject.requesting_take_off
      expect(plane).to be_flying
    end

    it 'raises an error message when the airport is empty' do
      expect{subject.requesting_take_off}.to raise_error 'Sorry - no planes to take off!'
    end

  end

  describe 'landing' do

    it 'receives a plane' do
      plane = Plane.new
      subject.landing plane
      expect(subject.empty?).to eq false
    end

    it 'instructs a plane to land' do
      plane = Plane.new
      subject.landing plane
      plane.land
      expect(plane).to be_landed
    end

    it 'raises an error message when the airport is full' do
      15.times {subject.landing Plane.new}
      expect{subject.landing Plane.new}.to raise_error 'The airport is full!'
    end

  end






  describe 'traffic control' do


    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'when weather conditions are stormy' do
      xit 'does not allow a plane to take off' do
        expect
      end

      xit 'does not allow a plane to land'
    end
  end
end
