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

  let(:plane){ Plane.new }
  let(:landed_plane) { Plane.new.ground }
  let(:flying_plane) {landed_plane.fly_away}


  it { is_expected.to respond_to :flying? }


  it 'is flying when created' do
    expect(plane).to be_flying
  end

  it 'can land; the landed plane status is downed' do
    expect(landed_plane).to_not be_flying
  end

  it 'can take off and then the plane status is up' do
    expect(flying_plane).to be_flying
  end

end

