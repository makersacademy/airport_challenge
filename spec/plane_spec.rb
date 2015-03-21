require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should have a "flying" status,
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status
# should become "flying"

describe Plane do
  let(:plane) { Plane.new }
  it 'has a flying status when created' do
    expect(plane).to be_flying
  end

  it 'has a flying status when in the air' do
    plane.take_off!
    expect(plane).to be_flying
  end

  xit 'can take off'

  xit 'changes its status to flying after taking off'

end
