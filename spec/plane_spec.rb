require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should be "flying",
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# be "landed"
#
# When the plane takes of from the airport, it should be "flying" again
#
# Think about your implementation - does it allow a plane to be "flying"
# and landed?
# Are you testing that?

describe Plane do

  let(:airport){double:airport}

  it 'is flying when created' do
    expect(subject).to be_flying
  end

  it 'can land and is in hangar after landing' do
    airport = Airport.new
    allow(airport).to receive(:weather) { "sunny" }
    airport.land subject
    expect(airport.hangar).to include(subject)
    # expect(subject).not_to be_flying
  end

  it 'can take off and is flying after take off' do
    airport = Airport.new
    allow(airport).to receive(:weather) { "sunny" }
    airport.land subject
    expect(airport.take_off).to eq(subject)
    expect(subject).to be_flying
  end

end
