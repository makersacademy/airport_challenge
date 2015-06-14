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
    xit 'instructs a plane to take off'

    xit 'releases a plane'
  end

  describe 'landing' do

    it{is_expected.to respond_to :tell_plane_to_land}
    
    #I am thinking of removing the below test as I can't think of a way 
    #of not testing both the plane and the airport at the same time.
    #This is because the airport method calls the plane method.
    #Any advice welcome.
    it 'instructs a plane to land' do
      plane = Plane.new
      landing_plane = double :plane, able_to_land?: true
      expect(subject.tell_plane_to_land plane).to eq true
    end

    it 'receives a plane' do
      plane = double :plane, able_to_land?: true
      allow(plane).to receive(:land_at_airport) {plane}
      expect(subject.land_plane plane).to eq plane
    end

    it 'does not receive a plane which is not able to land' do
      plane = double :plane, able_to_land?:false
      expect{subject.land_plane plane}.to raise_error 'Plane not cleared for landing'
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
