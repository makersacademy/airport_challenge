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

  xit 'has a flying status when created'

  xit 'has a flying status when in the air'

  xit 'can take off'

  it 'changes its status to flying after taking off' do
    plane = Plane.new true
    plane.takeoff
    expect(plane).to_not be_landed
  end

end
