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

  let(:airport) {double:airport}

  it 'is flying when created' do
    expect(subject).to be_flying
  end

  it 'can land' do
    allow(airport).to receive(:weather) { "sunny" }
    is_expected.to respond_to :has_landed
  end
  it 'is in the hangar after landing and is not flying' do
    allow(airport).to receive(:land) {subject}
    allow(airport).to receive(:hangar) {[subject]}
    expect(airport.hangar).to include(subject)
    subject.has_landed
    expect(subject).not_to be_flying
  end

  it 'can take off and is flying after take off' do
    allow(airport).to receive(:weather) { "sunny" }
    allow(airport).to receive(:take_off) {subject}
    is_expected.to respond_to :taken_off
    airport.take_off subject
    expect(subject).to be_flying
  end

end
