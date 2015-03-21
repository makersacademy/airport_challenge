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
    # This test is redundant with the 4th one. Tempted to delete.
    plane.landed!
    plane.take_off!
    expect(plane.status).to eq 'flying'
  end

  it 'can take off' do
    # meaning that that once landed it has a landed status. It can take off.
    plane.landed!
    expect(plane.status).to eq 'landed'
  end

  it 'changes its status to flying after taking off' do
    plane.landed!
    plane.take_off!
    expect(plane.status).to eq 'flying'
  end

  it 'cannot take off if already flying' do
    expect { plane.take_off! }.to raise_error 'This plane is already flying'
  end
end
