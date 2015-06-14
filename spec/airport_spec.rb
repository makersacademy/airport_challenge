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
      plane = double :plane, ready_to_take_off: false
      ready_plane = double :plane, ready_to_take_off: true
      allow(plane).to receive (:confirm_take_off) {ready_plane}
      expect(subject.tell_plane_to_take_off plane).to be ready_plane 
    end

    it 'releases a plane' do
      plane = double :plane, able_to_land?: true
      allow(plane).to receive (:land_at_airport) {plane}
      subject.land_plane plane
      allow(plane).to receive (:take_off) {plane}
      expect(subject.release_plane plane).to be plane
    end

  end

  describe 'landing' do

    it{is_expected.to respond_to :tell_plane_to_land}
    
    it 'instructs a plane to land' do
      plane = double :plane, able_to_land?: false
      landing_plane = double :plane, able_to_land?: true
      allow(plane).to receive (:change_landing_status) {true}
      expect(subject.tell_plane_to_land plane).to eq true
    end

    it 'receives a plane' do
      plane = double :plane, able_to_land?: true
      allow(plane).to receive(:land_at_airport) {plane}
      expect(subject.land_plane plane).to eq [plane]
    end

    it 'does not receive a plane which is not able to land' do
      plane = double :plane, able_to_land?:false
      expect{subject.land_plane plane}.to raise_error 'Plane not cleared for landing'
    end
    

  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        plane = double :plane, able_to_land?: true
        allow(plane).to receive(:land_at_airport) {plane}
        Airport::DEFAULT_CAPACITY.times {subject.land_plane plane}
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
      xit 'does not allow a plane to take off'

      xit 'does not allow a plane to land'
    end
  end
end
