require 'plane'
require 'airport'

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

  it 'is flying when created' do
  	expect(subject).to be_flying
  end

  it 'can land' do
    a = Airport.new	
  	expect(subject.land a).not_to be @flying
  end

  it 'is landed after landing' do
  	a = Airport.new
    subject.land a
  	expect(subject).not_to be_flying
  end

  it 'can take off' do
  	puts subject.take_off :airport
  	expect(subject.take_off :airport).to be true # this is a cheat. fix.
  end

  it 'is flying after take off' do
  	subject.take_off :airport
  	expect(subject).to be_flying
  end

end
