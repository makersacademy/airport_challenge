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
    expect(plane.status).to eq 'flying'
  end

  it 'has a flying status when in the air' do
    plane.take_off!
    expect(plane.status).to eq 'flying'
  end

  it 'can take off' do
    plane.landed!
    expect(plane.status).to eq 'landed'
  end

  it 'changes its status to flying after taking off' do
    plane.landed!
    plane.take_off!
    expect(plane.status).to eq 'flying'
  end
end
