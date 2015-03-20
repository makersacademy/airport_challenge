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

  it 'has a flying status when created' do
    expect(subject.flying?).to be true
  end

  # not really sure what this test would do
  # xit 'has a flying status when in the air'

  it { is_expected.to respond_to :land! }

  it 'can land, and change its status' do
    subject.land!
    expect(subject.flying?).to be false
  end

  # Possibly an overly complex test when all I need is the above
  xit 'can land and display the correct status' do
    plane = subject
    airport = double :Airport, land_plane: [plane]
    airport.land_plane(plane)
    expect(plane.flying?).to be false
  end

  xit 'has a landed status when in the airport'

  xit 'can take off'

  xit 'changes its status to flying after taking off'

end
