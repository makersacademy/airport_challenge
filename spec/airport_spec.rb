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

    it {is_expected.to respond_to :take_off}

    it 'raises error when airport is empty' do
      subject.current_number_of_planes.times {subject.take_off}
      expect {subject.take_off}.to raise_error "There are no planes to take off"
    end

  end

  describe 'landing' do
    it {is_expected.to respond_to(:land_plane).with(1).argument}

    it 'cannot land a landed plane' do
      plane = double :plane, :landed? => true
      expect {subject.land_plane(plane)}.to raise_error "This plane isn't flying"
    end



    it 'receives a plane'

  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        plane = double :plane, land: nil, :landed? => false
        subject.capacity.times {subject.land_plane(plane)}
        expect {subject.land_plane(plane)}.to raise_error "Airport is full"
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
