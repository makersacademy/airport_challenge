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
      expect(subject).to respond_to(:release)
    end

    it 'releases a plane' do
      airport = Airport.new
      airport.receive(Plane.new)
      plane = airport.release
      expect(plane).to be_flying
    end

    it 'no longer contains the plane that was just released' do
      airport = Airport.new
      plane = Plane.new
      airport.receive(plane)
      airport.release
      expect(airport.planes?).to_not include(plane)
    end

  end

  describe 'landing' do

    it 'instructs a plane to land' do
      expect(subject).to respond_to(:receive).with(1).argument
    end

    # it 'receives a plane' do
    #   expect(subject).to respond_to(:receive).with(1).argument
    # end

    it 'contains the plane it just received' do
      airport = Airport.new
      plane = Plane.new
      airport.receive(plane)
      expect(airport.planes?).to include(plane)
    end

  end

  describe 'traffic control' do

    context 'when the airport is empty' do

      it 'raises an error if a plane is requested for release' do
        expect{ subject.release }.to raise_error 'No planes available.'
      end

    end

    context 'when airport is full' do

      it 'does not allow a plane to land' do
        Airport::CAPACITY.times { subject.receive(Plane.new) }
        expect { subject.receive(Plane.new) }.to raise_error 'The airport is full.'
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
