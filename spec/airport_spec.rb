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

    it { is_expected.to respond_to :commence_take_off }
    it { is_expected.to respond_to :planes }
    it { is_expected.to respond_to :count_planes }


    it 'count the number of planes in the aiport' do
      airport = Airport.new
      expect(airport.count_planes).to eql 1
    end



  describe 'take off' do
    it 'instructs a plane to take off' do
    airport = Airport.new
    planes = airport.planes
    plane = planes.pop
    expect(plane).to respond_to :take_off

    end

    xit 'releases a plane'
  end

  describe 'landing' do
    xit 'instructs a plane to land'

    xit 'receives a plane'
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
