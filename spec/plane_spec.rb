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


  xit 'is flying when created'

  it 'can land'do
    expect(subject).to respond_to :land
  end

  it 'is landed after landing' do
    subject.land
    expect(subject.landed?).to be true
  end

  xit 'can take off'

  xit 'is flying after take off'

end
