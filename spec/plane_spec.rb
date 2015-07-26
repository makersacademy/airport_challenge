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
# Think about your implementation - does it allow a plane to be "flying" and landed?
# Are you testing that?

describe Plane do
  let(:airport){double(:airport)}
  it 'is flying when created' do
    expect(subject.report_status).to eq "Flying"
  end

  it 'can land' do
	expect(subject).to respond_to(:land)
  end

  it 'is landed after landing' do
  	allow(airport).to receive(:accept_plane)
  	allow(subject.land(airport))
  	expect(subject.report_status).to eq "Landed"
  end

  it 'can take off' do
  	expect(subject).to respond_to(:take_off)
  end

  it 'is flying after take off' do
  	allow(airport).to receive(:release_plane)
  	subject.take_off(airport)
  	expect(subject.report_status).to eq "Flying"
  end
end
