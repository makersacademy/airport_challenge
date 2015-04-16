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

describe 'plane must have permission to land' do
  it 'traffic control gives ok to land' do
    airport = Airport.new
    expect(airport.ok_to_land).to eq true
  end
end
