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

  #it 'is flying when created'
  it 'is flying when created' do
    subject
    expect(subject).to be_flying
  end

  #it 'can land'
  it 'can land' do
    subject.can_land
    expect {subject.can_land}.to raise_error 'the plane can not land if it is not flying'
  end

  #it 'is landed after landing'
  it 'is landed after landing' do
  	subject.can_land
    subject.landed?
  	expect(subject).to be_landed
	end

  #it 'can take off'
  it 'can take off' do
    subject
    expect {subject.can_take_off}.to raise_error 'The plane can not take off if it is not landed'
  end

  #it 'is flying after take off'
  xit 'is flying after take off' do
    subject.can_take_off
    expect(subject).to be_flying
  end
end
