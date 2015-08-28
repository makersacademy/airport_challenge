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

    context 'taking off and landing' do
        it { is_expected.to respond_to :land }
        it { is_expected.to respond_to :take_off }
        #it { is_expected.to respond_to :take_off
    end
    xcontext 'traffic control'

    it 'airport tells plane to land' do
        airport = Airport.new
        plane = double :plane
        allow(plane).to receive(:lands!) {true}
        airport.land plane
        expect(airport.planes.count).to eq 1
    end

    it 'airport tells plane to take_off' do
      airport = Airport.new
      plane = double(:plane, :lands! => nil)
      airport.land plane
      allow(plane).to receive(:takes_off!) {true}
      airport.take_off plane
      expect(airport.planes.count).to eq 0
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