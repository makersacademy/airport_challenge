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
    plane = Plane.new
    expect(plane.status).to eq 'flying'
  end

  it 'has a flying status when in the air' do
    plane = Plane.new
    expect(plane.location).to eq 'air'
  end

  it { is_expected.to respond_to :takeoff }
  it { is_expected.to respond_to :land }

  it 'has a status of landed after landing' do
    plane = Plane.new
    plane.land
    expect(plane.status).to eq 'landed'
  end

  it 'changes its status to flying after taking off' do
    plane = Plane.new
    plane.land
    plane.takeoff
    expect(plane.status).to eq 'flying'
  end
end
