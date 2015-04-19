require 'plane'

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

  it 'can land and receives the landed status' do
    plane.land
    expect(plane.status).to eq 'landed'
  end

  it 'can take off and gets a flying status when in the air' do
    plane.land
    plane.take_off
    expect(plane.status).to eq 'flying'
  end

  it 'cannot land if already on the ground' do
    plane.land
    expect { plane.land }.to raise_error 'Plane is already on ground'
  end

  it 'cannot take off if already in the sky' do
    expect { plane.take_off }.to raise_error 'Plane is already airborne'
  end

end
