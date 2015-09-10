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

  it 'is flying when created' do
    expect(subject.status).to eq 'flying'
  end

  it 'can only land if flying' do
    subject.instance_variable_set(:@status, 'landed')
    expect {subject.land}.to raise_error "You're already on the ground pilot"
  end

  it 'is landed after landing' do
    subject.land
    expect(subject.status).to eq 'landed'
  end

  it 'is flying after take off' do
    subject.instance_variable_set(:@status, 'landed')
    subject.take_off
    expect(subject.status).to eq 'flying'
  end
end
