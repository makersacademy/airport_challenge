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
  let(:plane) { Plane.new }
  context 'airport must approve' do
    xit 'when a plane is landing'

    xit 'when a plane is taking off'
  end

  context 'appropriate plane status checks' do
    it 'when a plane is landed, it cannot land' do
      plane.land
      expect { plane.land }.to raise_error 'Plane already landed.'
      # expect(plane).to have_attributes(status: 'flying')
    end
    xit 'when a plane is flying, it cannot take off'
    # expect(plane.take_off).not_to be _flying
  end

  context 'traffic control checks' do
    xit 'a plane cannot land if the airport is full'
    # expect(airport_status).to be < 20
  end

  # Include a weather condition.
  # The weather must be random and only have two states "sunny" or "stormy".
  # Try and take off a plane, but if the weather is stormy,
  # the plane can not take off and must remain in the airport.
  # This will require stubbing to stop the random return of the weather.
  # If the airport has a weather condition of stormy,
  # the plane can not land, and must not be in the airport

  context 'weather condition checks' do
    xit 'a plane cannot take off when there is a storm brewing'

    xit 'a plane cannot land in the middle of a storm'
  end
end
