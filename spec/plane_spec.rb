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
    expect(plane.flying_status).to eq 'Flying'
  end

  it 'has a flying status when landed' do
    plane.has_landed
    expect(plane.flying_status).to eq 'Landed'
  end

  it 'changes its status to flying after taking off' do
    plane.has_landed
    plane.taken_off
    expect(plane.flying_status).to eq 'Flying'
  end
end
