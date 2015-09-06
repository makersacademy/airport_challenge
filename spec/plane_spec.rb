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

  let(:plane) { Plane.new }

  it 'is flying when created' do
    expect(plane.flying?).to be true
  end

    it 'is flying after take off' do
      plane.flying?
      expect(plane).to be_flying
    end

  it 'is landed after landing' do
    plane.land!
    expect(plane).to_not be_flying
  end

  xit 'can take off'

  xit 'can land' do

  end




end
