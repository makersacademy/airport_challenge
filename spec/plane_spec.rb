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

  it 'returns an instance of Plane' do
    expect(Plane.new).to be_an_instance_of Plane
  end

  it 'is flying when created' do
    expect(subject).to be_flying
  end

  it 'can land' do
    expect(subject).to respond_to(:land)
  end

  it 'is landed after landing' do
    plane = Plane.new
    plane.land
    expect(plane).to_not be_flying
  end

  xit 'can take off'

  xit 'is flying after take off'

end
