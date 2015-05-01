require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should have a "flying" status,
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status
# should become "flying"

describe Plane do

  it 'has a flying status when created' do
    expect (subject).to be_flying
  end

  xit 'has a flying status when in the air'
  # I have no idea how to differentiate this from the other tests
  # Somehow test that any plane not landed shows as flying?
  # Maybe test that not(landed) implies flying?!
  # I'm going to leave it as tautologous for now, maybe poke again later

  it 'can take off' do
    airport = Airport.new
    airport.land subject
    expect { airport.launch subject }.not_to raise_error
    # As always, weather will default to sunny in tests unless set otherwise
  end

  it 'changes its status to flying after taking off' do
    airport = Airport.new
    airport.land subject
    airport.launch subject
    expect (subject).to be_flying
  end
end
