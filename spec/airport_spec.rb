require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full. SET CAPACITY
# It is up to you how many planes can land in the airport. SAY 20
# and how that is implemented. ref Bojo capcity statement
#
# If the airport is full then no planes can land
# ref bojo dock is full test and code

describe Airport do

  context 'taking off and landing' do
    it { is_expected.to respond_to :land }
    it { is_expected.to respond_to :take_off }

    it 'should have a plane after landing' do
      plane = double :plane
      allow(plane).to receive(:land) { 'landed' }
      airport = Airport.new
      airport.land plane
      expect(airport.planes.count).to eq 1
    end

  # 'lets planes land'
  #  'a plane can land'
  #  'a plane can take off from airport'

  end

  context 'traffic control' do # use with/as capacity statement
    it 'a plane cannot land if the airport is full' do
      heathrow = Airport.new
      6.times { heathrow.land Plane.new }
      expect { heathrow.land Plane.new }.to raise_error 'Airport full'
    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'weather conditions' do
      xit 'a plane cannot take off when there is a storm brewing'

      xit 'a plane cannot land in the middle of a storm'
    end
  end
end
